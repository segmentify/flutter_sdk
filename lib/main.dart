library flutter_sdk;

import 'package:firebase_messaging/firebase_messaging.dart';

import 'requests/push_service.dart';
import 'requests/request.dart';
import '../utils/storage.dart';
import '../utils/handle_device_information.dart';
import './utils/handle_user.dart';

// Segmentify Sdk Initializer
/// Initializes the Segmentify SDK and sets up the storage with the provided configuration.
///
/// The [segmentifyConfig] parameter is the configuration object for the Segmentify SDK.
/// The [logger] parameter is an optional boolean flag indicating whether to enable logging.
///
/// This constructor initializes the storage by calling the [initializeStorage] method.
/// It then sets the storage items for the 'sgm_config', 'sgm_user', 'logger', and 'deviceInformation' keys.
/// Finally, it calls the [initialUserHandler] method to handle the initial user setup.
///
/// Throws an exception if there is an error during the initialization process.
class SegmentifyInitializer {
  final dynamic segmentifyConfig;
  final bool logger;

  SegmentifyInitializer(
      {required this.segmentifyConfig,
      this.logger = false,
      FirebaseMessaging? messaging}) {
    SegmentifyInitializeStorage(
        segmentifyConfig: segmentifyConfig,
        logger: logger,
        messaging: messaging);
  }

  Future<void> SegmentifyInitializeStorage(
      {required segmentifyConfig, logger, FirebaseMessaging? messaging}) async {
    try {
      await initializeStorage();
      await setStorageItem(
          key: 'sgm_config', value: segmentifyConfig?['sgm_config']);
      if (segmentifyConfig?['sgm_user'] != null &&
          ((segmentifyConfig?['sgm_user']['userId'] != null &&
                  segmentifyConfig?['sgm_user']['userId'] != '') ||
              (segmentifyConfig?['sgm_user']['sessionId'] != null &&
                  segmentifyConfig?['sgm_user']['sessionId'] != ''))) {
        await setStorageItem(
            key: 'sgm_user', value: segmentifyConfig?['sgm_user']);
      }
      await setStorageItem(key: 'logger', value: logger);
      final deviceInformation = await getDeviceInformation();
      await setStorageItem(key: 'deviceInformation', value: deviceInformation);

      await initialUserHandler();

      if (messaging != null) {
        await _pushServiceInitializer(messaging: messaging);
      }
    } catch (e) {
      throw Exception('initializeStorage error: $e');
    }
  }
}

/// Creates and returns a new instance of the [SegmentifyEvent] class.
///
/// This method is used to create a new instance of the [SegmentifyEvent] class,
/// which can be used to track events in the Segmentify SDK.
///
/// Returns a [Future] that resolves to the created [SegmentifyEvent] instance.
Future<SegmentifyEvent> segmentifyEvent() async {
  final segmentifyEvent = SegmentifyEvent();
  return segmentifyEvent;
}

/// Segmentify Push Service Initializer
Future<dynamic> _pushServiceInitializer(
    {required FirebaseMessaging messaging}) async {
  final notificationService = SegmentifyNotificationService();
  return await notificationService.initialize(messaging);
}
