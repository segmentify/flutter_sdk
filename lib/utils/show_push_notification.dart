import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:segmentify_flutter_sdk/constants/push.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> showSegmentifyNotification(
    String title, String body, String instanceId) async {
  final randomInt = Random().nextInt(100);
  var androidDetails = const AndroidNotificationDetails(
      pushAndroidChannelId, pushAndroidChannelName,
      channelDescription: pushAndroidChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true);
  var iOSDetails = const DarwinNotificationDetails();
  var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iOSDetails);

  await flutterLocalNotificationsPlugin.show(
      randomInt, // Notification ID
      title, // Notification Title
      body, // Notification Body
      generalNotificationDetails, // Notification Details
      payload: instanceId // Payload
      );
}
