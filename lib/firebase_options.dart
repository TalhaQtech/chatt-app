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
    apiKey: 'AIzaSyADGwb1z6-JrweuNsE7wQ-Qxa_9pMtQa3M',
    appId: '1:699243963253:web:f0bd81e384ca37c9e4693c',
    messagingSenderId: '699243963253',
    projectId: 'chattapp-9a5eb',
    authDomain: 'chattapp-9a5eb.firebaseapp.com',
    storageBucket: 'chattapp-9a5eb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAP0fMRXZoB2syJz9bVqUL4VzT30XVFrXU',
    appId: '1:699243963253:android:8ab6112a3c504f87e4693c',
    messagingSenderId: '699243963253',
    projectId: 'chattapp-9a5eb',
    storageBucket: 'chattapp-9a5eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTw-76Dq03KJeESRHRm3a4uBY_pqK_AxQ',
    appId: '1:699243963253:ios:08796743dbcff6ade4693c',
    messagingSenderId: '699243963253',
    projectId: 'chattapp-9a5eb',
    storageBucket: 'chattapp-9a5eb.appspot.com',
    iosClientId: '699243963253-dab6dm7bjj5uan2d44mvkhdgln6dtmil.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTw-76Dq03KJeESRHRm3a4uBY_pqK_AxQ',
    appId: '1:699243963253:ios:08796743dbcff6ade4693c',
    messagingSenderId: '699243963253',
    projectId: 'chattapp-9a5eb',
    storageBucket: 'chattapp-9a5eb.appspot.com',
    iosClientId: '699243963253-dab6dm7bjj5uan2d44mvkhdgln6dtmil.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
