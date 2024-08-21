import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
     
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLTz7iZ_1dt7F1_SMKzPFs_CwZeA0tKyM',
    appId: '1:616615263803:android:0f4b068bd9d185640c661e',
    messagingSenderId: '616615263803',
    projectId:'movies-2edb9',
    storageBucket: 'movies-2edb9.appspot.com',
  );
}
