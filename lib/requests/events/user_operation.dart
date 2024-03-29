import 'dart:convert' as convert;
import 'package:segmentify_flutter_sdk/utils/get_common_params.dart';
import '../../models/event_types.dart';

Future<dynamic> userOperationEvent(UserOperationModel payload) async {
  final commonParams = await getCommonParams();

  payload.userId = payload.userId ?? commonParams['userId'];
  payload.sessionId = payload.sessionId ?? commonParams['sessionId'];
  payload.device = payload.device ?? commonParams['device'];
  payload.os = payload.os ?? commonParams['os'];
  payload.lang = payload.lang ?? commonParams['lang'];

  final mappedPayload = payload.toMap();
  final jsonPayload = convert.jsonEncode(mappedPayload);

  return jsonPayload;
}

Future<dynamic> userChangeEvent(UserChangeModel payload) async {
  final commonParams = await getCommonParams();

  payload.sessionId = payload.sessionId ?? commonParams['sessionId'];
  payload.device = payload.device ?? commonParams['device'];
  payload.os = payload.os ?? commonParams['os'];
  payload.lang = payload.lang ?? commonParams['lang'];

  final mappedPayload = payload.toMap();
  final jsonPayload = convert.jsonEncode(mappedPayload);

  return jsonPayload;
}
