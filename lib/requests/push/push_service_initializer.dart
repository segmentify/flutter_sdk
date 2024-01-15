import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utils/account_config_getter.dart';
import '../events/push_subscription.dart';

// Initializes push service taking firebase messaging instance as parameter
// Returns a future that submits push request to Segmentify
Future<dynamic> pushServiceInitializer(
    FirebaseMessaging fireBaseInstance) async {
  print('Initializing push service');
  final user = await getUser();
  print('User: $user');
  NotificationSettings settings = await fireBaseInstance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('Settings: $settings');
  final pushGranted = settings.authorizationStatus;
  print('Push granted: $pushGranted');
  String? token = await fireBaseInstance.getToken();

  print('User granted permission: $pushGranted');

  switch (pushGranted) {
    case AuthorizationStatus.provisional:
    case AuthorizationStatus.authorized:
      await firePushSubscriptionEvent(token!, user['userId']);
      break;
    case AuthorizationStatus.denied:
      //TODO : Handle denied case
      break;
    default:
      return;
  }
}
