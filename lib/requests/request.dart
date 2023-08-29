import 'package:flutter_sdk/requests/credentials.interceptor.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart' as Constants;

// Segmentify Event Sender Class
class SegmentifyEvent {
  // Client Api Key Provided by Segmentify
  final String apiKey;
  // Client Domain Name
  final String domainName;
  // Request Headers
  static const String acceptType = 'application/json';
  static const String contentType = 'text/plain';

  SegmentifyEvent(this.apiKey, this.domainName);

  // Request Credentials from Segmentify API (GET)
  Future<Credentials> requestCredentials(int requestedFields) async {
    final response = await http.get(
      Uri.parse(
          '${Constants.dataCenterUrl}${Constants.credentialUrl}?count=$requestedFields'),
      headers: <String, String>{
        'X-Sfy-Api-Key': apiKey,
        'Origin': domainName,
        'Accept': acceptType,
        'Content-Type': contentType,
      },
    );

    var serializedResponse = await convert.jsonDecode(response.body);

    if (serializedResponse.statusCode == 200 &&
        serializedResponse.body.isNotEmpty) {
      return Credentials.fromJson(serializedResponse);
    }

    throw Exception('Failed to load credentials');
  }

  // Send Event to Segmentify API (POST)
}
