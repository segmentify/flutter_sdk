import 'package:flutter_sdk/utils/account_config_getter.dart';

/// Retrieves common parameters required for API requests.
///
/// This function retrieves the user information, including the user ID and session ID,
/// as well as the device information, including the device type and operating system.
/// It also retrieves the language used by the user.
///
/// Returns a [Map] containing the following parameters:
/// - 'userId': The user ID.
/// - 'sessionId': The session ID.
/// - 'device': The device type.
/// - 'os': The operating system.
/// - 'lang': The language.
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
