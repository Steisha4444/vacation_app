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
    apiKey: 'AIzaSyDZBhHkJYPJGLcH3Wk5G0ViTCd_SgfzRJU',
    appId: '1:383861966246:web:1cebb2f5497004bf8b7b67',
    messagingSenderId: '383861966246',
    projectId: 'app-shop-fd534',
    authDomain: 'app-shop-fd534.firebaseapp.com',
    databaseURL: 'https://app-shop-fd534-default-rtdb.firebaseio.com',
    storageBucket: 'app-shop-fd534.appspot.com',
    measurementId: 'G-E22Y74PBXV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGGsvaAvacB42jZRZq6zdL4Ox_xEhVapA',
    appId: '1:383861966246:android:7a5d9a4ab11fa8598b7b67',
    messagingSenderId: '383861966246',
    projectId: 'app-shop-fd534',
    databaseURL: 'https://app-shop-fd534-default-rtdb.firebaseio.com',
    storageBucket: 'app-shop-fd534.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeSkWvv3QxAk8a4Ekou686ylFyZA5E7_Y',
    appId: '1:383861966246:ios:78e294976e6a79838b7b67',
    messagingSenderId: '383861966246',
    projectId: 'app-shop-fd534',
    databaseURL: 'https://app-shop-fd534-default-rtdb.firebaseio.com',
    storageBucket: 'app-shop-fd534.appspot.com',
    iosClientId: '383861966246-42o17m3b1r0qeg2g38mro8rse76l8n2m.apps.googleusercontent.com',
    iosBundleId: 'com.example.vacationApp',
  );
}
