library flutter_sdk;

import 'requests/request.dart';

// Segmentify Sdk Initializer
class SegmentifyInitializer {
  final String apiKey;
  final String domainName;

  SegmentifyInitializer(this.apiKey, this.domainName);

  // Segmentify Event Sender Constructor
  SegmentifyEvent get eventSender => SegmentifyEvent(apiKey, domainName);
}
