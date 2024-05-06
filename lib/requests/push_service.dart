import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:segmentify_flutter_sdk/utils/show_push_notification.dart';

import '../utils/account_config_getter.dart';
import 'events/push_events.dart';

class SegmentifyNotificationService {
  void Function(dynamic message)? callback;

  Future<void> initialize(FirebaseMessaging messaging,
      void Function(dynamic message)? messagingCallback) async {
    callback = messagingCallback;
    final user = await getUser();

    // Request permission for push notifications
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );

    final pushGranted = settings.authorizationStatus;
    String? token = await messaging.getToken();

    switch (pushGranted) {
      case AuthorizationStatus.provisional:
      case AuthorizationStatus.authorized:
        // Granted case for push notifications
        await pushSubscriptionEvent(token!, user['userId']);
        break;
      case AuthorizationStatus.denied:
        //TODO : Handle denied case
        break;
      default:
        break;
    }

    await _localNotificationInitializer();

    // Uygulama açıkken bildirim geldiğinde yapılacak işlemler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onMessage(message);
    });

    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

    return Future.value();
  }

  Future<void> _localNotificationInitializer() async {
    // Initialization for local notifications plugin for Android and iOS platforms
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    return Future.value();
  }

  void _onMessage(RemoteMessage message) async {
    // Handle foreground notifications
    // print('Notification received [FOREGROUND]');
    // print('Message: $message');
    // print('Notification: ${message.notification}');
    // print('Data: ${message.data}');
    // print('Message ID: ${message.messageId}');
    // print('Collapse Key: ${message.collapseKey}');
    // print(
    //     'Message Notif Title: ${message.notification?.title ?? 'Title is null'}');
    // print(
    //     'Message Notif Body: ${message.notification?.body ?? 'Body is null'}');

    // print('Message Title: ${message.data['title'] ?? 'Title is null'}');
    // print('Message Body: ${message.data['body'] ?? 'Body is null'}');

    final data = message.data;
    final title = data['title'] ?? '';
    final body = data['body'] ?? '';
    final stringifiedData = jsonEncode(data);

    showSegmentifyNotification(title, body, stringifiedData);
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    // Handle background notifications
    // print('Notification received [BACKGROUND]');
    // print('Message: $message');
    // print('Sender ID: ${message.senderId}');
    // print('Category: ${message.category}');
    // print('Collapse Key: ${message.collapseKey}');
    // print('Content Available: ${message.contentAvailable}');
    // print('Data: ${message.data}');
    // print('From: ${message.from}');
    // print('Message ID: ${message.messageId}');
    // print('Message Type: ${message.messageType}');
    // print('Mutable Content: ${message.mutableContent}');
    // print('Notification: ${message.notification}');
    // print('Sent Time: ${message.sentTime}');
    // print('Thread ID: ${message.threadId}');
    // print('TTL: ${message.ttl}');

    final data = message.data;
    final title = data['title'] ?? '';
    final body = data['body'] ?? '';
    final stringifiedData = jsonEncode(data);

    showSegmentifyNotification(title, body, stringifiedData);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {
    final payload = notificationResponse.payload;

    pushInteractionEvent(payload, 'CLICK');

    if (callback != null) {
      // Call the callback function if it is not null
      final decodedPayload = jsonDecode(payload!);
      callback!(decodedPayload);
    }
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    // For iOS 10 or lower, this callback will not be triggered when app is in background or terminated.
    pushInteractionEvent(payload, 'CLICK');

    if (callback != null) {
      // Call the callback function if it is not null
      final decodedPayload = jsonDecode(payload!);
      callback!(decodedPayload);
    }
  }
}
