import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

/// Retrieves the device information including the device name, device type, and app version.
/// Returns a [Future] that resolves to a [Map] containing the device information.
/// The device name is determined based on the platform:
///   - For Android devices, it is composed of the brand, manufacturer, and model.
///   - For iOS devices, it is prefixed with "iPhone" and includes the machine name.
///   - For other platforms (e.g., web), it is set to "WEB".
/// The device type is determined based on the platform's operating system.
/// The app version is the operating system version for Android and iOS devices,
/// and an empty string for other platforms.
///
///  Example usage:
/// ```dart
/// Map<String, String> deviceInfo = await getDeviceInfo();
/// print(deviceInfo['deviceName']);
/// print(deviceInfo['deviceType']);
/// print(deviceInfo['appVersion']);
/// ```
Future<Map<String, String>> getDeviceInformation() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName;
  String deviceOS = Platform.operatingSystem.toUpperCase();
  String deviceOSVersion;

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceName =
        "${androidInfo.brand} ${androidInfo.manufacturer} ${androidInfo.model}";
    deviceOSVersion = androidInfo.version.release;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceName = "iPhone ${iosInfo.utsname.machine}";
    deviceOSVersion = iosInfo.systemVersion;
  } else {
    deviceName = 'WEB';
    deviceOSVersion = '';
  }

  return {
    'deviceName': deviceName,
    'deviceType': deviceOS,
    'appVersion': deviceOSVersion,
  };
}
