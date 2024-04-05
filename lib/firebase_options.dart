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
    apiKey: 'AIzaSyBO-iKtHc10-wn-D3t2PhHUx3lsfWMzYQg',
    appId: '1:988691039433:web:e2752d4f65b8d2161af918',
    messagingSenderId: '988691039433',
    projectId: 'itds283-gr03-ggew',
    authDomain: 'itds283-gr03-ggew.firebaseapp.com',
    storageBucket: 'itds283-gr03-ggew.appspot.com',
    measurementId: 'G-G2GTGD487D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABeVGFqNyQNV7rAObvJ1gqzFZ9s0pqX2M',
    appId: '1:988691039433:android:3f852340185be7c71af918',
    messagingSenderId: '988691039433',
    projectId: 'itds283-gr03-ggew',
    storageBucket: 'itds283-gr03-ggew.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCo9M1TwkN77K1e-1RiuLuJQaxiPe7luP0',
    appId: '1:988691039433:ios:33ec18199c871ad21af918',
    messagingSenderId: '988691039433',
    projectId: 'itds283-gr03-ggew',
    storageBucket: 'itds283-gr03-ggew.appspot.com',
    iosBundleId: 'com.example.itds283Gr03ProjectGoGreenEzyWheels',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCo9M1TwkN77K1e-1RiuLuJQaxiPe7luP0',
    appId: '1:988691039433:ios:4fdbb4105b08c8bd1af918',
    messagingSenderId: '988691039433',
    projectId: 'itds283-gr03-ggew',
    storageBucket: 'itds283-gr03-ggew.appspot.com',
    iosBundleId: 'com.example.itds283Gr03ProjectGoGreenEzyWheels.RunnerTests',
  );
}
