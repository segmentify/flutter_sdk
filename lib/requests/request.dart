import 'dart:convert' as convert;
import '../requests/api_getaway.dart';
import '../constants/app_constants.dart' as constants;
import '../constants/event_params.dart';
import '../utils/account_config_getter.dart';

// Segmentify Event Sender Class
class SegmentifyEvent {
  var dio = ApiService().createDio();

  // Request Credentials from Segmentify API (GET)
  Future<List<dynamic>> requestCredentials(int requestedFields) async {
    print('Request Credentials');
    final response = await dio.get(
        '${constants.dataCenterUrl}${constants.credentialUrl}?count=$requestedFields');
    final responseData = response.data;
    final responseDataType = responseData.runtimeType;
    final responseStatusCode = response.statusCode;
    print('Response Credentials: ${response}');
    print('Response Credentials Type: ${responseDataType}');
    print('Response Credentials Status Code: ${responseStatusCode}');

    if (response.statusCode == 200 &&
        responseData != null &&
        responseData != '' &&
        responseData != 'null') {
      print('Response Credentials Return: ${responseData}');
      return responseData;
    }

    throw Exception('Failed to load credentials');
  }

  // Send Event to Segmentify API (POST)
  Future<dynamic> fireEvent(String type, dynamic eventPayload) async {
    print('Fire Event Type: $type');
    final eventType = eventPayload['name'];
    if (type == eventType) {
      final requiredParams = SEGMENTIFY_EVENT_PARAMS[type]?['requiredParams'];
      final optionalParams = SEGMENTIFY_EVENT_PARAMS[type]?['optionalParams'];

      final deviceInformation = await getDeviceInformation();
      final deviceType = deviceInformation['deviceType'];
      final language = await getLanguage();

      final autocompleteParams = {
        'lang': language,
        'os': deviceType,
        'device': deviceType,
      };

      requiredParams?.forEach((param) => {
            if (!eventPayload[param])
              {
                if (autocompleteParams[param])
                  {eventPayload[param] = autocompleteParams[param]}
                else
                  {throw Exception('$param is required for $type event')}
              }
          });

      optionalParams?.forEach((param) => {
            if (!eventPayload[param]) {eventPayload.remove(param)}
          });
      print('Event Payload: $eventPayload');
      final apiKey = await getApiKey();
      final dataCenterUrl = await getDataCenterUrl();

      final response = await dio.post(
          '$dataCenterUrl${constants.eventUrl}?apiKey=$apiKey',
          data: eventPayload);

      return response.data;
    }

    throw Exception('Event type and event payload name does not match');
  }
}
