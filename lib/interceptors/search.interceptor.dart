class ISearch {
  // Required Params
  String name;
  String query;
  String type = 'faceted'; // Must be 'faceted'

  // Optional Params
  String? trigger;
  String? service;
  String? mode;
  dynamic filters;
  Map<String, dynamic>? ordering;

  // Required Common Params
  String sessionId;
  String userId;
  String device;
  String os;
  String lang;

  ISearch({
    required this.name,
    required this.query,
    required this.type,
    this.trigger,
    this.service,
    this.mode,
    this.filters,
    this.ordering,
    required this.sessionId,
    required this.userId,
    required this.device,
    required this.os,
    required this.lang,
  });

  factory ISearch.fromMap(Map<String, dynamic> map) {
    return ISearch(
      name: map['name'],
      query: map['query'],
      type: map['type'],
      trigger: map['trigger'],
      service: map['service'],
      mode: map['mode'],
      filters: map['filters'],
      ordering: map['ordering'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }
}
