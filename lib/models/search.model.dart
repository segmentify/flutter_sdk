class SearchModel {
  // Required Params
  String query;

  // Optional Params
  String? trigger;
  String? service;
  String? mode;
  dynamic filters;
  Map<String, dynamic>? ordering;

  // Required Common Params
  String? sessionId;
  String? userId;
  String? device;
  String? os;
  String? lang;

  SearchModel({
    required this.query,
    this.trigger,
    this.service,
    this.mode,
    this.filters,
    this.ordering,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': 'SEARCH', // SEARCH is required
      'query': query,
      if(trigger != null && trigger != '') 'trigger': trigger,
      if(service != null && service != '') 'service': service,
      if(mode != null && mode != '') 'mode': mode,
      if(filters != null) 'filters': filters,
      if(ordering != null) 'ordering': ordering,
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }

  factory SearchModel.fromMap(Map<String, dynamic> map) {
    return SearchModel(
      query: map['query'],
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