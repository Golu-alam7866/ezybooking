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
    apiKey: 'AIzaSyAjLvXVTxkLpLplBDRK-b6iatniLU_Ie3w',
    appId: '1:549178427896:web:a81b982c6057a38bd06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    authDomain: 'socialaura.firebaseapp.com',
    storageBucket: 'socialaura.appspot.com',
    measurementId: 'G-VHBDP09N2V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCl3lvtBIGs4ctn9uFnhtN4YT0JhSrLNCA',
    appId: '1:549178427896:android:7ab259ad4d9ed9c1d06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    storageBucket: 'socialaura.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAR-glUvv179495cK5pUrtA7sF61AOPYpM',
    appId: '1:549178427896:ios:ed9da868023786cdd06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    storageBucket: 'socialaura.appspot.com',
    androidClientId: '549178427896-41kr1ohch2ffpm3018iqj4u965rb0qca.apps.googleusercontent.com',
    iosClientId: '549178427896-3d9p36o26kkb84ug0s2giovga55qta5d.apps.googleusercontent.com',
    iosBundleId: 'com.example.ezybooking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAR-glUvv179495cK5pUrtA7sF61AOPYpM',
    appId: '1:549178427896:ios:ed9da868023786cdd06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    storageBucket: 'socialaura.appspot.com',
    androidClientId: '549178427896-41kr1ohch2ffpm3018iqj4u965rb0qca.apps.googleusercontent.com',
    iosClientId: '549178427896-3d9p36o26kkb84ug0s2giovga55qta5d.apps.googleusercontent.com',
    iosBundleId: 'com.example.ezybooking',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAygB1_nOulG5NWdAMA4rzBIzmoidjrfHk',
    appId: '1:549178427896:web:141e1526c4692e87d06e0d',
    messagingSenderId: '549178427896',
    projectId: 'socialaura',
    authDomain: 'socialaura.firebaseapp.com',
    storageBucket: 'socialaura.appspot.com',
    measurementId: 'G-8Y879FHPEF',
  );
}
