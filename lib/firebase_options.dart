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
    apiKey: 'AIzaSyAnHIMIK9Xpzs_F3UVbnNB5ViS_xnOc8Mw',
    appId: '1:428347232075:web:aef07343de898bb2a6e2ce',
    messagingSenderId: '428347232075',
    projectId: 'music-app-c0fa2',
    authDomain: 'music-app-c0fa2.firebaseapp.com',
    storageBucket: 'music-app-c0fa2.appspot.com',
    measurementId: 'G-053FLTP94C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYnHse5IGK15s8O_S3zAwKoKJ_sStBaB4',
    appId: '1:428347232075:android:ee9d9d7643b60b78a6e2ce',
    messagingSenderId: '428347232075',
    projectId: 'music-app-c0fa2',
    storageBucket: 'music-app-c0fa2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBg7MjHQxrcT6qVGNynLz2kJBOoEUHIItw',
    appId: '1:428347232075:ios:a96b4cae6732551ba6e2ce',
    messagingSenderId: '428347232075',
    projectId: 'music-app-c0fa2',
    storageBucket: 'music-app-c0fa2.appspot.com',
    iosBundleId: 'com.example.music',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBg7MjHQxrcT6qVGNynLz2kJBOoEUHIItw',
    appId: '1:428347232075:ios:df918ef5f324d971a6e2ce',
    messagingSenderId: '428347232075',
    projectId: 'music-app-c0fa2',
    storageBucket: 'music-app-c0fa2.appspot.com',
    iosBundleId: 'com.example.music.RunnerTests',
  );
}
