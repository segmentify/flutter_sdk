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

Future<SegmentifyEvent> segmentifyEvent() async {
  final segmentifyEvent = SegmentifyEvent();
  return segmentifyEvent;
}




