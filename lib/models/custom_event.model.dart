class CustomEventModel {
  // Required Params
  String type;

  // Optional Params
  Map<String, dynamic>? params;

  // Required Common Params
  String? sessionId;
  String? userId;
  String? device;
  String? os;
  String? lang;

  CustomEventModel({
    required this.type,
    this.params,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  factory CustomEventModel.fromMap(Map<String, dynamic> map) {
    return CustomEventModel(
      type: map['type'],
      params: map['params'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': 'CUSTOM_EVENT', // CUSTOM_EVENT is required
      'type': type,
      if(params != null) 'params': params,
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}
