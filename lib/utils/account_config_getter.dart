import 'dart:convert' as convert;
import '../utils/storage.dart';

Future<String> getSubDomain() async {
  final config = await getStorageItem(key: 'config');
  final subDomain = config?['subDomain'];

  if (subDomain == null || subDomain == '') {
    throw Exception('Error: Subdomain is not defined.');
  }

  return subDomain;
}

Future<String> getApiKey() async {
  final config = await getStorageItem(key: 'config');
  print('Config: $config');
  final apiKey = config?['apiKey'];
  print('ApiKey: $apiKey');

  if (apiKey == null || apiKey == '') {
    throw Exception('Error: API Key is not defined.');
  }

  return apiKey;
}

Future<String> getDataCenterUrl() async {
  final config = await getStorageItem(key: 'config');
  final dataCenterUrl = config?['dataCenterUrl'];

  if (dataCenterUrl == null || dataCenterUrl == '') {
    throw Exception('Error: Base URL is not defined.');
  }

  return dataCenterUrl;
}

Future<Object> getApiKeyWithBaseUrl() async {
  final apiKey = await getApiKey();
  final dataCenterUrl = await getDataCenterUrl();

  return {
    apiKey,
    dataCenterUrl,
  };
}

Future<String> getDataCenterPushUrl() async {
  final config = await getStorageItem(key: 'config');
  final dataCenterPushUrl = config?['dataCenterPushUrl'];

  if (dataCenterPushUrl == null || dataCenterPushUrl == '') {
    throw Exception('Error: Data Center Push Url is not defined.');
  }

  return dataCenterPushUrl;
}

Future<dynamic> getDeviceInformation() async {
  final device = await getStorageItem(key: 'deviceInformation');
  final mappedDevice = await convert.jsonDecode(device);

  if (device == null) {
    throw Exception('Error: Device is not defined.');
  }

  return mappedDevice;
}

Future<Object> getConfiguration() async {
  final config = await getStorageItem(key: 'config');

  if (config == null) {
    throw Exception('Error: Configuration is not defined.');
  }

  return config;
}

Future<Object> getUser() async {
  final user = await getStorageItem(key: 'user');

  if (user == null) {
    throw Exception('Error: User is not defined.');
  }

  return user;
}

Future<String> getLanguage() async {
  final config = await getStorageItem(key: 'config');
  final language = config?['language'];

  if (language == null) {
    throw Exception('Error: Language is not defined.');
  }

  return language;
}
