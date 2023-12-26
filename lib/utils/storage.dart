import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Sets the value of a storage item with the specified key.
///
/// The [key] parameter is required and represents the key of the storage item.
/// The [value] parameter is dynamic and represents the value to be stored.
/// The value is encoded as JSON before being stored in SharedPreferences.
///
/// Throws an [Exception] if an error occurs while setting the storage item.
Future<void> setStorageItem({required String key, dynamic value}) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    String jsonValue = json.encode(value);
    await prefs.setString(key, jsonValue);
  } catch (e) {
    throw Exception('setItem error: $e');
  }
}

/// Retrieves the value associated with the given [key] from the storage.
/// If the value is null, returns null.
/// If the value is a JSON string, decodes it and returns the value of the key.
/// If the value is not a JSON string, returns the value as is.
/// Throws an exception if there is an error while retrieving the item.
///
/// Example usage:
/// ```dart
/// final storageUser = await getStorageItem(key: 'user');
/// ```
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

/// Removes the storage item with the specified key.
/// The [key] parameter is required and represents the key of the storage item.
/// Throws an [Exception] if an error occurs while removing the storage item.
///
/// Example usage:
/// ```dart
/// await removeStorageItem(key: 'user');
/// ```
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
