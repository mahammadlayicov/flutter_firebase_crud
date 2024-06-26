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
    apiKey: 'AIzaSyDL6CbuFwx7SoE__eFtit7w353MM38OSqk',
    appId: '1:127799367484:web:11b824d52c24a0f7a07039',
    messagingSenderId: '127799367484',
    projectId: 'fir-crud-fd319',
    authDomain: 'fir-crud-fd319.firebaseapp.com',
    storageBucket: 'fir-crud-fd319.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDK22JNX-H4E5YUQWdovO-rypuMdBl6ORQ',
    appId: '1:127799367484:android:4be9690df1dd6790a07039',
    messagingSenderId: '127799367484',
    projectId: 'fir-crud-fd319',
    storageBucket: 'fir-crud-fd319.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQa7whdMHqwsb2MwBNNfWJrj2jEFRqUq4',
    appId: '1:127799367484:ios:67567715f476dd18a07039',
    messagingSenderId: '127799367484',
    projectId: 'fir-crud-fd319',
    storageBucket: 'fir-crud-fd319.appspot.com',
    iosBundleId: 'com.example.firebaseCrud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQa7whdMHqwsb2MwBNNfWJrj2jEFRqUq4',
    appId: '1:127799367484:ios:67567715f476dd18a07039',
    messagingSenderId: '127799367484',
    projectId: 'fir-crud-fd319',
    storageBucket: 'fir-crud-fd319.appspot.com',
    iosBundleId: 'com.example.firebaseCrud',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDL6CbuFwx7SoE__eFtit7w353MM38OSqk',
    appId: '1:127799367484:web:98638969f2871837a07039',
    messagingSenderId: '127799367484',
    projectId: 'fir-crud-fd319',
    authDomain: 'fir-crud-fd319.firebaseapp.com',
    storageBucket: 'fir-crud-fd319.appspot.com',
  );
}
