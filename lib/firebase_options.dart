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
    apiKey: 'AIzaSyBPVqVaUfDhKLCeaIs-H15VtouZiBpHhf0',
    appId: '1:200981317791:web:88c79fa7864fa77a3e7aaa',
    messagingSenderId: '200981317791',
    projectId: 'pixelwibes-507d4',
    authDomain: 'pixelwibes-507d4.firebaseapp.com',
    storageBucket: 'pixelwibes-507d4.appspot.com',
    measurementId: 'G-6JTVG7FKXC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl5auQnNIXDpnqhBcysQEgregTxVlr1l0',
    appId: '1:200981317791:android:dc7654fecb21c0b63e7aaa',
    messagingSenderId: '200981317791',
    projectId: 'pixelwibes-507d4',
    storageBucket: 'pixelwibes-507d4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9X0jHx0bDtjz1UxPr0_eI3nhpOIzCyzA',
    appId: '1:200981317791:ios:ef9d98c6a801d8b73e7aaa',
    messagingSenderId: '200981317791',
    projectId: 'pixelwibes-507d4',
    storageBucket: 'pixelwibes-507d4.appspot.com',
    iosBundleId: 'com.example.pixelwibes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9X0jHx0bDtjz1UxPr0_eI3nhpOIzCyzA',
    appId: '1:200981317791:ios:ef9d98c6a801d8b73e7aaa',
    messagingSenderId: '200981317791',
    projectId: 'pixelwibes-507d4',
    storageBucket: 'pixelwibes-507d4.appspot.com',
    iosBundleId: 'com.example.pixelwibes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBPVqVaUfDhKLCeaIs-H15VtouZiBpHhf0',
    appId: '1:200981317791:web:8cc0da19e300adab3e7aaa',
    messagingSenderId: '200981317791',
    projectId: 'pixelwibes-507d4',
    authDomain: 'pixelwibes-507d4.firebaseapp.com',
    storageBucket: 'pixelwibes-507d4.appspot.com',
    measurementId: 'G-LW79H4C653',
  );

}