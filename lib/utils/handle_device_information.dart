import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

Future<Map<String, String>> getDeviceInformation() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName;
  String deviceOS = Platform.operatingSystem.toLowerCase();
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
