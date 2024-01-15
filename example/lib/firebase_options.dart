import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

FirebaseOptions get firebaseOptions {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return const FirebaseOptions(
      appId: '1:794335569547:android:2dd7ab3c0e14426066568e',
      apiKey: 'AIzaSyBul9RNuHLGGfjPwH8YdtC5D9qTPC4eDcs',
      projectId: 'segmentify-qa',
      messagingSenderId: '794335569547',
    );
  }

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return const FirebaseOptions(
      appId: 'ios_appId',
      apiKey: 'ios_apiKey',
      projectId: 'ios_projectId',
      messagingSenderId: 'ios_messagingSenderId',
    );
  }

  throw UnsupportedError('Unsupported platform');
}
