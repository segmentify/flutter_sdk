library flutter_sdk;

import 'package:flutter_sdk/requests/push/push_service_sgm.dart';

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
/// It then sets the storage items for the 'config', 'user', 'logger', and 'deviceInformation' keys.
/// Finally, it calls the [initialUserHandler] method to handle the initial user setup.
///
/// Throws an exception if there is an error during the initialization process.
class SegmentifyInitializer {
  final dynamic segmentifyConfig;
  final bool logger;

  SegmentifyInitializer({required this.segmentifyConfig, this.logger = false}) {
    SegmentifyInitializeStorage(
        segmentifyConfig: segmentifyConfig, logger: logger);
  }

  Future<void> SegmentifyInitializeStorage(
      {required segmentifyConfig, logger}) async {
    try {
      await initializeStorage();
      await setStorageItem(key: 'config', value: segmentifyConfig?['config']);
      if (segmentifyConfig?['user'] != null) {
        await setStorageItem(key: 'user', value: segmentifyConfig?['user']);
      }
      await setStorageItem(key: 'logger', value: logger);
      final deviceInformation = await getDeviceInformation();
      await setStorageItem(key: 'deviceInformation', value: deviceInformation);

      await initialUserHandler();
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
Future<dynamic> pushServiceInitializer() async {
  print('Initializing push service');
  final notifService = SegmentifyNotificationService();
  print('SegmentifyNotificationService: $notifService');
  return await notifService.initialize();
}
