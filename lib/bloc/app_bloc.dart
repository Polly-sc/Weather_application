import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_event.dart';
import 'package:flutter_developer_test_task/bloc/app_state.dart';
import 'package:flutter_developer_test_task/core/global_types.dart';
import 'package:flutter_developer_test_task/features/auth/errors/auth_errors.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/datasources/weather_remote_data_source.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';
import 'package:flutter_developer_test_task/services/check_internet_connection.dart';
import 'package:flutter_developer_test_task/services/get_current_location.dart';
import 'package:http/http.dart';

import '../features/weather_info/data/datasources/weather_local_data_source.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
    // const AppStateLoggedOut(
    //   isLoading: false,
    // ),
    const AppStateInitialize(
        isLoading: false
    ),
  ) {
    on<AppEventGoToRegistration>((event, emit) {
      emit(
        const AppStateIsInRegistrationView(
          isLoading: false,
        ),
      );
    });
    on<AppEventLogIn>(
          (event, emit) async {
        emit(
          const AppStateLoggedOut(
            isLoading: true,
          ),
        );
        // log the user in
        try {
          final String userUid;
          final WeatherForecastModel? forecastWeather;
          final email = event.email;
          final password = event.password;
          final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
            final bool isConnectivity = await checkConnectivity();
          if (isConnectivity) {
            if (userCredential.user != null) {
              userUid = userCredential.user!.uid;
              final Coords coords = await getCurrentLocation();
              forecastWeather = await getForecastWeather(coords);
              weatherToCache(forecastWeather);
              userToCache(userUid);
            } else {
              print('Authentication failed');
              throw UnimplementedError();
            }
          } else {
            forecastWeather = await getWeatherFromCahce();
            userUid = await getUserFromCache();
          }
              emit(
                AppStateLoggedIn(
                  forecastWeather: forecastWeather,
                  isLoading: false,
                  userUid: userUid,
                ),
              );
        } on FirebaseAuthException catch (e) {
          emit(
            AppStateLoggedOut(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      }
    );
    on<AppEventGoToLogin>(
          (event, emit) {
        emit(
          const AppStateLoggedOut(
            isLoading: false,
          ),
        );
      },
    );
    on<AppEventRegister>(
          (event, emit) async {
            // start loading
            emit(
              const AppStateIsInRegistrationView(
                isLoading: true,
              ),
            );
            final email = event.email;
            final password = event.password;
            try {
              final String currentUser;
              final WeatherForecastModel forecastWeather;
              final email = event.email;
              final password = event.password;
              final userCredential = await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                email: email,
                password: password,
              );
                final String userUid;
                final bool isConnectivity = await checkConnectivity();
                if (isConnectivity) {
                  if (userCredential.user != null) {
                    userUid = userCredential.user!.uid;
                  final Coords coords = await getCurrentLocation();
                  forecastWeather = await getForecastWeather(coords);
                  weatherToCache(forecastWeather);
                  userToCache(userUid);
                } else {
                  print('Authentication failed');
                  throw UnimplementedError();
                }
                } else {
                  forecastWeather = await getWeatherFromCahce();
                  userUid = await getUserFromCache();
                }
                emit(
                  AppStateLoggedIn(
                    forecastWeather: forecastWeather,
                    isLoading: false,
                    userUid: userUid,
                  ),
                );
            } on FirebaseAuthException catch (e) {
              emit(
                AppStateIsInRegistrationView(
                  isLoading: false,
                  authError: AuthError.from(e),
                ),
              );
            }
          }
    );
    on<AppEventInitialize>(
          (event, emit) async {
            Duration duration = Duration(seconds: 5);
            await Future.delayed(duration);
            final WeatherForecastModel forecastWeather;
            final userUid = FirebaseAuth.instance.currentUser?.uid;
            if (userUid == null) {
              emit(
                const AppStateLoggedOut(
                  isLoading: false,
                ),
              );
            } else {
              final String _userUid;
              final bool isConnectivity = await checkConnectivity();
              if (isConnectivity) {
                final Coords coords = await getCurrentLocation();
                forecastWeather = await getForecastWeather(coords);
                weatherToCache(forecastWeather);
                userToCache(userUid);
                _userUid = userUid;
              } else {
                forecastWeather = await await getWeatherFromCahce();
                _userUid = await getUserFromCache();
              }
                emit(
                  AppStateLoggedIn(
                    isLoading: false,
                    userUid: _userUid,
                    forecastWeather: forecastWeather,
                  ),
                );
            }
          }
    );
    // log out event
    on<AppEventLogOut>(
          (event, emit) async {
        // start loading
        emit(
          const AppStateLoggedOut(
            isLoading: true,
          ),
        );
        // log the user out
        await FirebaseAuth.instance.signOut();
        // log the user out in the UI as well
        emit(
          const AppStateLoggedOut(
            isLoading: false,
          ),
        );
      },
    );
  }
}