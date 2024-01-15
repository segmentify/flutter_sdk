import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utils/account_config_getter.dart';
import '../events/push_subscription.dart';

class SegmentifyNotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    print('Initializing push service');
    final user = await getUser();
    print('User: $user');

    // Kullanıcıdan bildirim gösterme izni iste
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: false,
    );

    final pushGranted = settings.authorizationStatus;
    print('Push granted: $pushGranted');
    String? token = await _messaging.getToken();

    print('User granted permission: $pushGranted');

    switch (pushGranted) {
      case AuthorizationStatus.provisional:
      case AuthorizationStatus.authorized:
        print('PUSH GRANTED');
        // await firePushSubscriptionEvent(token!, user['userId']);
        break;
      case AuthorizationStatus.denied:
        //TODO : Handle denied case
        break;
      default:
        break;
    }

    // Uygulama açıkken bildirim geldiğinde yapılacak işlemler
    FirebaseMessaging.onMessage.listen(_onMessage);

    // Uygulama arka planda çalışırken bildirim geldiğinde yapılacak işlemler
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // Background bildirim handler'ını ayarla
    FirebaseMessaging.onBackgroundMessage(_backgroundMessageHandler);

    return Future.value();
  }

  void _onMessage(RemoteMessage message) {
    // Bildirim geldiğinde yapılacak işlemler...
  }

  void _onMessageOpenedApp(RemoteMessage message) {
    // Bildirime tıklandığında yapılacak işlemler...
  }

  static Future<void> _backgroundMessageHandler(RemoteMessage message) async {
    // Arka planda gelen bildirimleri işle
  }
}
