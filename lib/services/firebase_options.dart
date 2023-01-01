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
    apiKey: 'AIzaSyDP_owTbS9r5S8ShByqJ6o6pv1zfNQ3isA',
    appId: '1:921203505862:web:52f5bc96889604a497f5c7',
    messagingSenderId: '921203505862',
    projectId: 'riddleme-e34ac',
    authDomain: 'riddleme-e34ac.firebaseapp.com',
    storageBucket: 'riddleme-e34ac.appspot.com',
    measurementId: 'G-9W8MBXDPWE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAz1vmabffpJaBtmLW6r5UVn-0vrz8Mg8U',
    appId: '1:921203505862:android:b2fd76a9c7b5fb8797f5c7',
    messagingSenderId: '921203505862',
    projectId: 'riddleme-e34ac',
    storageBucket: 'riddleme-e34ac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAW9yCPiQzA6QXxlBIRfw-HOd3diw2DaQU',
    appId: '1:921203505862:ios:8ef1337b17bd373f97f5c7',
    messagingSenderId: '921203505862',
    projectId: 'riddleme-e34ac',
    storageBucket: 'riddleme-e34ac.appspot.com',
    iosClientId:
        '921203505862-gh3lktt8oojrtj7h84b7j273k2j798lf.apps.googleusercontent.com',
    iosBundleId: 'com.example.riddleMe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAW9yCPiQzA6QXxlBIRfw-HOd3diw2DaQU',
    appId: '1:921203505862:ios:8ef1337b17bd373f97f5c7',
    messagingSenderId: '921203505862',
    projectId: 'riddleme-e34ac',
    storageBucket: 'riddleme-e34ac.appspot.com',
    iosClientId:
        '921203505862-gh3lktt8oojrtj7h84b7j273k2j798lf.apps.googleusercontent.com',
    iosBundleId: 'com.example.riddleMe',
  );
}
