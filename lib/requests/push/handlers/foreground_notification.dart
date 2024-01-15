import 'package:firebase_messaging/firebase_messaging.dart';

Future<dynamic> handleForegroundNotification(
    FirebaseMessaging messaging) async {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
}
