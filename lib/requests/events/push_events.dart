import 'dart:convert' as convert;
import 'package:segmentify_flutter_sdk/utils/account_config_getter.dart';

import '../../constants/app_constants.dart';
import '../api_getaway.dart';

// Sends a PUSH_SUBSCRIPTION event payload to the Segmentify API.
// The [payload] parameter is required and represents the firebase token to be sent.
// The [userId] parameter is required and represents the user id to be sent.
// Returns the response data.

Future<dynamic> pushSubscriptionEvent(
    String? fireBasePermissionToken, String userId) async {
  if (fireBasePermissionToken == null) {
    print('Firebase permission token is null');
    return;
  }
  var dio = ApiService().createDio();

  final apiKey = await getApiKey();
  final dataCenterPushUrl = await getDataCenterPushUrl();
  final deviceInformation = await getDeviceInformation();
  final deviceType = deviceInformation['deviceType'];
  final configuration = await getConfiguration();
  final isApnsEnabled = configuration['isApnsEnabled'];

  Map<String, dynamic> dataToShip = {
    'providerType': 'FIREBASE',
    'deviceToken': fireBasePermissionToken,
    'userId': userId,
    'os': deviceType,
  };

  if (deviceType == 'ios' && isApnsEnabled) {
    dataToShip['providerType'] = 'APNS';
  }
  final jsonDataToShip = convert.jsonEncode(dataToShip);

  final response = await dio.post(
      '$dataCenterPushUrl$pushNotificationUrl?apiKey=$apiKey',
      data: jsonDataToShip);

  return response.data;
}

Future<dynamic> pushInteractionEvent(instanceId, type) async {
  var dio = ApiService().createDio();

  final apiKey = await getApiKey();
  final user = await getUser();
  final userId = user['userId'];
  final dataCenterPushUrl = await getDataCenterPushUrl();
  final deviceInformation = await getDeviceInformation();
  final deviceType = deviceInformation['deviceType'];

  Map<String, dynamic> data = {
    'instanceId': instanceId,
    'type': type,
    'os': deviceType,
    'userId': userId,
  };

  final jsonData = convert.jsonEncode(data);

  final response = await dio.post(
      '$dataCenterPushUrl$pushNotificationInteractionUrl?apiKey=$apiKey',
      data: jsonData);

  return response.data;
}
