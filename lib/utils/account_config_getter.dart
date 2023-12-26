import '../utils/storage.dart';

/// Retrieves the subdomain from the storage configuration.
/// Throws an exception if the subdomain is not defined.
Future<String> getSubDomain() async {
  final config = await getStorageItem(key: 'config');
  final subDomain = config?['subDomain'];

  if (subDomain == null || subDomain == '') {
    throw Exception('Error: Subdomain is not defined.');
  }

  return subDomain;
}

/// Retrieves the API key from the storage configuration.
/// Throws an exception if the API key is not defined.
Future<String> getApiKey() async {
  final config = await getStorageItem(key: 'config');
  final apiKey = config?['apiKey'];

  if (apiKey == null || apiKey == '') {
    throw Exception('Error: API Key is not defined.');
  }

  return apiKey;
}

/// Retrieves the data center URL from the storage configuration.
/// Throws an exception if the data center URL is not defined.
Future<String> getDataCenterUrl() async {
  final config = await getStorageItem(key: 'config');
  final dataCenterUrl = config?['dataCenterUrl'];

  if (dataCenterUrl == null || dataCenterUrl == '') {
    throw Exception('Error: Base URL is not defined.');
  }

  return dataCenterUrl;
}

/// Retrieves the API key and data center URL for the account configuration.
///
/// Returns a map containing the API key and data center URL.
/// The API key is retrieved using the [getApiKey] function,
/// and the data center URL is retrieved using the [getDataCenterUrl] function.
/// The map has the following structure:
/// {
///   'apiKey': apiKey,
///   'dataCenterUrl': dataCenterUrl,
/// }
///
/// Example usage:
/// ```dart
/// final accountConfig = await getAccountConfig();
/// print(accountConfig['apiKey']);
/// print(accountConfig['dataCenterUrl']);
/// ```
Future<Map<String, String>> getApiKeyWithBaseUrl() async {
  final apiKey = await getApiKey();
  final dataCenterUrl = await getDataCenterUrl();

  return {
    'apiKey': apiKey,
    'dataCenterUrl': dataCenterUrl,
  };
}

/// Retrieves the data center push URL from the storage configuration.
/// Throws an exception if the data center push URL is not defined.
Future<String> getDataCenterPushUrl() async {
  final config = await getStorageItem(key: 'config');
  final dataCenterPushUrl = config?['dataCenterPushUrl'];

  if (dataCenterPushUrl == null || dataCenterPushUrl == '') {
    throw Exception('Error: Data Center Push Url is not defined.');
  }

  return dataCenterPushUrl;
}

/// Retrieves the device information from the storage configuration.
/// Throws an exception if the device information is not defined.
Future<dynamic> getDeviceInformation() async {
  final device = await getStorageItem(key: 'deviceInformation');

  if (device == null) {
    throw Exception('Error: Device is not defined.');
  }

  return device;
}

/// Retrieves the configuration from the storage.
/// Throws an exception if the configuration is not defined.
Future<Map<String, dynamic>> getConfiguration() async {
  final config = await getStorageItem(key: 'config');

  if (config == null) {
    throw Exception('Error: Configuration is not defined.');
  }

  return config;
}

/// Retrieves the user information from storage.
///
/// Throws an exception if the user is not defined.
/// Returns the user information if it exists.
///
/// Throws:
///   - Exception: If the user is not defined.
///
/// Returns:
///   - The user information.
///
/// Example usage:
/// ```dart
/// final user = await getStorageItem(key: 'user');
/// ```
Future<Map<String, dynamic>> getUser() async {
  final user = await getStorageItem(key: 'user');

  if (user == null) {
    throw Exception('Error: User is not defined.');
  }

  return user;
}

/// Retrieves the language configuration from the storage.
///
/// Returns the language code if it is defined in the configuration.
/// Throws an exception if the language is not defined.
///
/// Throws:
///   - Exception: If the language is not defined in the configuration.
///
/// Returns:
///   - String: The language code.
///§
/// Example usage:
/// ```dart
/// final language = await getLanguageConfiguration();
/// print(language); // en_US
/// ```
Future<String> getLanguage() async {
  final config = await getStorageItem(key: 'config');
  final language = config?['language'];

  if (language == null) {
    throw Exception('Error: Language is not defined.');
  }

  return language;
}
