// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD6zpFX39cWJYLft2uSaIzZgnVcHbQ3VpQ',
    appId: '1:619574553838:web:5e1c4b940e0a5a58cd17ff',
    messagingSenderId: '619574553838',
    projectId: 'weather-app-83796',
    authDomain: 'weather-app-83796.firebaseapp.com',
    storageBucket: 'weather-app-83796.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXLABGa5pL5x_4wOXgJ9ljj2hwjJTujNQ',
    appId: '1:619574553838:android:f0568222dec0f1e7cd17ff',
    messagingSenderId: '619574553838',
    projectId: 'weather-app-83796',
    storageBucket: 'weather-app-83796.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAXokLwwTqZlGiTH1ExnPzbraZuTNX90ko',
    appId: '1:619574553838:ios:c52a71da8b39a767cd17ff',
    messagingSenderId: '619574553838',
    projectId: 'weather-app-83796',
    storageBucket: 'weather-app-83796.appspot.com',
    iosBundleId: 'com.example.flutterDeveloperTestTask',
  );
}
