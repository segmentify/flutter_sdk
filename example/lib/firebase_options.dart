import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

FirebaseOptions get firebaseOptions {
  if (defaultTargetPlatform == TargetPlatform.android) {
    return const FirebaseOptions(
      appId:
          '1:794335569547:android:2dd7ab3c0e14426066568e', // google-services.json -> client -> client_info -> mobilesdk_app_id
      apiKey:
          'AIzaSyBul9RNuHLGGfjPwH8YdtC5D9qTPC4eDcs', // google-services.json -> client -> api_key -> current
      projectId:
          'segmentify-qa', // google-services.json -> project_info -> project_id
      messagingSenderId:
          '794335569547', // google-services.json -> project_info -> project_number
    );
  }

  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return const FirebaseOptions(
      appId:
          'ios_appId', // GoogleService-Info.plist -> CLIENT_ID -> REVERSED_CLIENT_ID
      apiKey:
          'ios_apiKey', // GoogleService-Info.plist -> API_KEY -> CURRENT_KEY (or API_KEY)
      projectId:
          'ios_projectId', // GoogleService-Info.plist -> PROJECT_ID (or PROJECT_NUMBER)
      messagingSenderId:
          'ios_messagingSenderId', // GoogleService-Info.plist -> PROJECT_NUMBER (or SENDER_ID)
    );
  }

  throw UnsupportedError('Unsupported platform');
}
