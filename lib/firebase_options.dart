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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCbH2C5S3UDVB90w3nAmNXPD2eym493ucE',
    appId: '1:295169246924:web:01fd73e404bed0bf80e469',
    messagingSenderId: '295169246924',
    projectId: 'food365-89950',
    authDomain: 'food365-89950.firebaseapp.com',
    databaseURL: 'https://food365-89950-default-rtdb.firebaseio.com',
    storageBucket: 'food365-89950.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_5dPwjh_4gbhmCD_JDp2K536FoqG4-9c',
    appId: '1:295169246924:android:7c7c09ce0414898380e469',
    messagingSenderId: '295169246924',
    projectId: 'food365-89950',
    databaseURL: 'https://food365-89950-default-rtdb.firebaseio.com',
    storageBucket: 'food365-89950.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB5b7u4N96d4fVM8qxLdC9Zj3jo-I5fp30',
    appId: '1:295169246924:ios:9ffc18ce812a944980e469',
    messagingSenderId: '295169246924',
    projectId: 'food365-89950',
    databaseURL: 'https://food365-89950-default-rtdb.firebaseio.com',
    storageBucket: 'food365-89950.appspot.com',
    iosClientId: '295169246924-c5ghec8prq912usdikht29gauhlbstbo.apps.googleusercontent.com',
    iosBundleId: 'com.example.food365',
  );
}
