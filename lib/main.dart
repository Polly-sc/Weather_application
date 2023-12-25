import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_bloc.dart';
import 'package:flutter_developer_test_task/bloc/app_event.dart';
import 'package:flutter_developer_test_task/bloc/app_state.dart';
import 'package:flutter_developer_test_task/features/auth/presentation/views/login_view.dart';
import 'package:flutter_developer_test_task/features/weather_info/presentation/screens/splash_screen.dart';
import 'package:flutter_developer_test_task/firebase_options.dart';
import 'package:flutter_developer_test_task/loading/loading_screen.dart';

import 'features/auth/dialogs/show_auth_error.dart';
import 'features/auth/presentation/views/registration_view.dart';
import 'features/weather_info/presentation/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
        create: (_) => AppBloc()
      ..add(
        const AppEventInitialize(),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }
            final authError = appState.authError;
            if (authError != null) {
              showAuthError(
                authError: authError,
                context: context,
              );
            }
          },
          builder: (context, appState) {
            if (appState is AppEventInitialize) {
              return SplashScreen();
            } else if (appState is AppStateInitialize){
              return SplashScreen();
            } else if (appState is AppStateLoggedOut) {
              return LoginView();
            } else if (appState is AppStateLoggedIn) {
              return MainScreen();
            } else if (appState is AppStateIsInRegistrationView) {
              return const RegisterView();
            } else {
              return Container();
            }
          },
        ),
      )
    );
  }
}

