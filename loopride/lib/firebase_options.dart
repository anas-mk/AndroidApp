// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDgx99n0-2E5LG0ZeQOQrK7fe5_rwFVI0g',
    appId: '1:776529281713:web:39a0ff92621b01f74e9890',
    messagingSenderId: '776529281713',
    projectId: 'ride-b6be9',
    authDomain: 'ride-b6be9.firebaseapp.com',
    storageBucket: 'ride-b6be9.firebasestorage.app',
    measurementId: 'G-NF852FEX74',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxKMbiwF3HcURkw5hWo93f_Y161KdzWsE',
    appId: '1:776529281713:android:33f0275573ba27e64e9890',
    messagingSenderId: '776529281713',
    projectId: 'ride-b6be9',
    storageBucket: 'ride-b6be9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXTCBJrTrvP84ZmoDdbLD_FKfOlN_tb6g',
    appId: '1:776529281713:ios:11f826d52e53832e4e9890',
    messagingSenderId: '776529281713',
    projectId: 'ride-b6be9',
    storageBucket: 'ride-b6be9.firebasestorage.app',
    iosBundleId: 'com.example.loopride',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXTCBJrTrvP84ZmoDdbLD_FKfOlN_tb6g',
    appId: '1:776529281713:ios:11f826d52e53832e4e9890',
    messagingSenderId: '776529281713',
    projectId: 'ride-b6be9',
    storageBucket: 'ride-b6be9.firebasestorage.app',
    iosBundleId: 'com.example.loopride',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDgx99n0-2E5LG0ZeQOQrK7fe5_rwFVI0g',
    appId: '1:776529281713:web:dd9f26ba78db37154e9890',
    messagingSenderId: '776529281713',
    projectId: 'ride-b6be9',
    authDomain: 'ride-b6be9.firebaseapp.com',
    storageBucket: 'ride-b6be9.firebasestorage.app',
    measurementId: 'G-F347XN8BGP',
  );

}