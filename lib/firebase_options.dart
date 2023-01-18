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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAvLgAeeI47jTg5KwbGuhoTDhNIo1C6h-E',
    appId: '1:834291257005:web:8ab7ed429a79a809c08024',
    messagingSenderId: '834291257005',
    projectId: 'puente-paraiso',
    authDomain: 'puente-paraiso.firebaseapp.com',
    storageBucket: 'puente-paraiso.appspot.com',
    measurementId: 'G-W4BWHKRZ70',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAz6sg4EOZIozPYt420vCmE9-u6J60Axk4',
    appId: '1:834291257005:android:49b8553fc28b8924c08024',
    messagingSenderId: '834291257005',
    projectId: 'puente-paraiso',
    storageBucket: 'puente-paraiso.appspot.com',
  );
}
