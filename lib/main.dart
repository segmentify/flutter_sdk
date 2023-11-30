library flutter_sdk;

import 'requests/request.dart';
import '../utils/storage.dart';
import '../utils/handle_device_information.dart';
import './utils/handle_user.dart';

// Segmentify Sdk Initializer
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
      print('Segmentify SDK Initialized');
      await setStorageItem(key: 'config', value: segmentifyConfig?['config']);
      print('Segmentify Config: ${segmentifyConfig?["config"]}');
      if (segmentifyConfig?['user'] != null) {
        await setStorageItem(key: 'user', value: segmentifyConfig?['user']);
        print('Segmentify User: ${segmentifyConfig?["user"]}');
      }
      await setStorageItem(key: 'logger', value: logger);
      print('Segmentify Logger: $logger');
      final deviceInformation = await getDeviceInformation();
      await setStorageItem(key: 'deviceInformation', value: deviceInformation);
      print('Segmentify Device Information: $deviceInformation');

      await initialUserHandler();
    } catch (e) {
      throw Exception('initializeStorage error: $e');
    }
  }

  // Segmentify Event Sender Constructor
  SegmentifyEvent segmentifyEvent = SegmentifyEvent();
}
