import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_developer_test_task/features/auth/errors/auth_errors.dart';
import 'package:flutter_developer_test_task/features/weather_info/data/models/forecast_weather_model.dart';

@immutable
abstract class AppState {
  final bool isLoading;
  final AuthError? authError;

  const AppState({
    required this.isLoading,
    this.authError,
  });
}

@immutable
class AppStateLoggedIn extends AppState {
  final String userUid;
  final WeatherForecastModel forecastWeather;
  const AppStateLoggedIn({
    required bool isLoading,
    required this.userUid,
    required this.forecastWeather,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );

  @override
  bool operator ==(other) {
    final otherClass = other;
    if (otherClass is AppStateLoggedIn) {
      return isLoading == otherClass.isLoading &&
          userUid == otherClass.userUid &&
          forecastWeather == otherClass.forecastWeather;
    } else {
      return false;
    }
  }

  @override
  String toString() => 'AppStateLoggedIn';
}


class AppStateInitialize extends AppState {
  const AppStateInitialize({
    required bool isLoading,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );

  @override
  String toString() =>
      'AppStateLoggedOut, isLoading = $isLoading, authError = $authError';
}

@immutable
class AppStateLoggedOut extends AppState {
  const AppStateLoggedOut({
    required bool isLoading,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );

  @override
  String toString() =>
      'AppStateLoggedOut, isLoading = $isLoading, authError = $authError';
}

@immutable
class AppStateIsInRegistrationView extends AppState {
  const AppStateIsInRegistrationView({
    required bool isLoading,
    AuthError? authError,
  }) : super(
    isLoading: isLoading,
    authError: authError,
  );
}

extension GetUser on AppState {
  User? get user {
    final cls = this;
    if (cls is AppStateLoggedIn) {
      return cls.user;
    } else {
      return null;
    }
  }
}