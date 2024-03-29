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
    apiKey: 'AIzaSyDB7bn57pKLpi1M-bz0lVO-q9Gamx5xzss',
    appId: '1:481720229500:web:65f3623871c62c66f133f9',
    messagingSenderId: '481720229500',
    projectId: 'cryptolist-first-app',
    authDomain: 'cryptolist-first-app.firebaseapp.com',
    storageBucket: 'cryptolist-first-app.appspot.com',
    measurementId: 'G-GBB7TMPLKP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEeu8_d5oyWKHKIoK8RxNWjRHnwulw_Xg',
    appId: '1:481720229500:android:efa799ad051f6779f133f9',
    messagingSenderId: '481720229500',
    projectId: 'cryptolist-first-app',
    storageBucket: 'cryptolist-first-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBpIPI7H_SnRHonsgfkTfcutmMdhOIEdF4',
    appId: '1:481720229500:ios:03a0cf6c12e82741f133f9',
    messagingSenderId: '481720229500',
    projectId: 'cryptolist-first-app',
    storageBucket: 'cryptolist-first-app.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBpIPI7H_SnRHonsgfkTfcutmMdhOIEdF4',
    appId: '1:481720229500:ios:d2de9c7daefab32ff133f9',
    messagingSenderId: '481720229500',
    projectId: 'cryptolist-first-app',
    storageBucket: 'cryptolist-first-app.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
