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
        return macos;
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
    apiKey: 'AIzaSyDZA9n25tZbx4dfKAMhcOEbINcuHUvOCkE',
    appId: '1:506765403462:web:57e85cfb35f4ffddccb147',
    messagingSenderId: '506765403462',
    projectId: 'sw-escape-b32f4',
    authDomain: 'sw-escape-b32f4.firebaseapp.com',
    storageBucket: 'sw-escape-b32f4.appspot.com',
    measurementId: 'G-Z753SWPPW6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDC8Qe2gBTWFfiATh5c4CZJhHXg908I5M',
    appId: '1:506765403462:android:b559fd7e069626c4ccb147',
    messagingSenderId: '506765403462',
    projectId: 'sw-escape-b32f4',
    storageBucket: 'sw-escape-b32f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyJkyE80chTzw1FB3efACtjWFSwiqM2MU',
    appId: '1:506765403462:ios:ac82815ef7ad3b96ccb147',
    messagingSenderId: '506765403462',
    projectId: 'sw-escape-b32f4',
    storageBucket: 'sw-escape-b32f4.appspot.com',
    iosBundleId: 'com.example.swEscape',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyJkyE80chTzw1FB3efACtjWFSwiqM2MU',
    appId: '1:506765403462:ios:531299fd9049dd9dccb147',
    messagingSenderId: '506765403462',
    projectId: 'sw-escape-b32f4',
    storageBucket: 'sw-escape-b32f4.appspot.com',
    iosBundleId: 'com.example.swEscape.RunnerTests',
  );
}
