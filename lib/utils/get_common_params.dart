import 'package:flutter_sdk/utils/account_config_getter.dart';

Future<Map<String, dynamic>> getCommonParams() async {
  final user = await getUser();
  final userId = user['userId'];
  final sessionId = user['sessionId'];
  final deviceInformation = await getDeviceInformation();
  final deviceType = deviceInformation['deviceType'];
  final language = await getLanguage();

  return {
    'userId': userId,
    'sessionId': sessionId,
    'device': deviceType,
    'os': deviceType,
    'lang': language,
  };
}
