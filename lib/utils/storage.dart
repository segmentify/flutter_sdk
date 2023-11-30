import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setStorageItem({required String key, dynamic value}) async {
  try {
    print('Set Storage Item: $key - $value');
    final prefs = await SharedPreferences.getInstance();
    print('Set Storage Prefs: $prefs');
    String jsonValue = json.encode(value);
    print('Set Storage Json Value: $jsonValue');
    await prefs.setString(key, jsonValue);
    print('Set Storage Item 2: $key - $jsonValue');
    // Updated all the values in the storage
    final updatedValue = await getStorageItem(key: key);
    print('Updated $key: $updatedValue');
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
      print('getStorageItem - 1: $value');
      return null;
    }

    try {
      // If the value is a json string, decode it and return the value of the key
      print('getStorageItem - 2: $value');
      return json.decode(value);
    } catch (e) {
      // If the value is not a json string, return the value
      print('getStorageItem - 3: $value');
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
    print('isInitialized: $isInitialized');
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
