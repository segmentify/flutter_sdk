import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setStorageItem({required String key, dynamic value}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    String jsonValue = json.encode(value);
    await prefs.setString(key, jsonValue);
  } catch (e) {
    throw Exception('setItem error: $e');
  }
}

Future<dynamic> getStorageItem({required String key}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);

    if (value == null) {
      // If the value is null, return null
      return null;
    }

    try {
      // If the value is a json string, decode it and return the value of the key
      return json.decode(value);
    } catch (e) {
      // If the value is not a json string, return the value
      return value;
    }
  } catch (e) {
    throw Exception('getItem error: $e');
  }
}

Future<void> initializeStorage() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final isInitialized = prefs.getBool('isInitialized');
    if (isInitialized == null || isInitialized == false) {
      await prefs.setBool('isInitialized', true);
      await prefs.setString('config',
          '{"apiKey": "", "dataCenterUrl": "", "subDomain": "", "dataCenterPushUrl": "", "isApnsEnabled": false}');
      await prefs.setString('deviceInformation',
          '{"deviceName": "", "deviceType": "", "appVersion": ""}');
      await prefs.setString('user', '{"userId": "", "sessionId": ""}');
    }
  } catch (e) {
    throw Exception('initializeStorage error: $e');
  }
}
