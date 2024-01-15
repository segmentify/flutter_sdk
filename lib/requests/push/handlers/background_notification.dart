import 'package:firebase_messaging/firebase_messaging.dart';

Future<dynamic> handleBackgroundNotification(
    FirebaseMessaging messaging) async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('A new onMessageOpenedApp event was published!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  FirebaseMessaging.onBackgroundMessage((message) async => {});
}
