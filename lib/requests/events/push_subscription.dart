import 'package:flutter_sdk/utils/account_config_getter.dart';

import '../../constants/app_constants.dart';
import '../api_getaway.dart';

// Sends a PUSH_SUBSCRIPTION event payload to the Segmentify API.
// The [payload] parameter is required and represents the firebase token to be sent.
// The [userId] parameter is required and represents the user id to be sent.
// Returns the response data.

Future<dynamic> firePushSubscriptionEvent(
    String? fireBasePermissionToken, String userId) async {
  if (fireBasePermissionToken == null) {
    print('Firebase permission token is null');
    return;
  }

  var dio = ApiService().createDio();
  final apiKey = await getApiKey();
  final dataCenterUrl = await getDataCenterPushUrl();
  final deviceInformation = await getDeviceInformation();

  final dataToShip = {
    'providerType': 'FIREBASE',
    'deviceToken': fireBasePermissionToken,
    'userId': userId,
    'os': deviceInformation['deviceType'],
  };

  final response = await dio.post(
      '$dataCenterUrl$pushNotificationUrl?apiKey=$apiKey',
      data: dataToShip);

  return response.data;
}
