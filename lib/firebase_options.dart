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
    apiKey: 'AIzaSyCJ8g28DTfdDfFCr2CCkyUoZS1qD2dj2fc',
    appId: '1:657493988993:web:a6e5e9bcfcf010c5f5df80',
    messagingSenderId: '657493988993',
    projectId: 'gwhyyworkout',
    authDomain: 'gwhyyworkout.firebaseapp.com',
    storageBucket: 'gwhyyworkout.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_9pZeKJWZizNqHPBRYIXYtWS9wOaWnCM',
    appId: '1:657493988993:android:a80c74cb823f86acf5df80',
    messagingSenderId: '657493988993',
    projectId: 'gwhyyworkout',
    storageBucket: 'gwhyyworkout.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCe4624TcT-AFy48jr258a0cPuOBJjg6SI',
    appId: '1:657493988993:ios:cbbaf473f203f3c0f5df80',
    messagingSenderId: '657493988993',
    projectId: 'gwhyyworkout',
    storageBucket: 'gwhyyworkout.appspot.com',
    iosClientId: '657493988993-plut0km170gtkujhlpu1lb4jtfki9e69.apps.googleusercontent.com',
    iosBundleId: 'com.workout.workOut',
  );
}
