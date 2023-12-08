enum InteractionTypes {
  impression,
  click,
  search,
  widgetView,
}

String getInteractionType(InteractionTypes type) {
  switch (type) {
    case InteractionTypes.impression:
      return 'impression';
    case InteractionTypes.click:
      return 'click';
    case InteractionTypes.search:
      return 'search';
    case InteractionTypes.widgetView:
      return 'widget-view';
    default:
      throw Exception('Interaction type is not defined.');
  }
}

class InteractionModel {
  // Required Params
  InteractionTypes type;

  // Optional Params
  String? interactionId;
  String? instanceId;

  // Required Common Params
  String? sessionId;
  String? device;
  String? os;
  String? userId;
  String? lang;

  InteractionModel({
    required this.type,
    this.interactionId,
    this.instanceId,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  factory InteractionModel.fromMap(Map<String, dynamic> map) {
    return InteractionModel(
      type: map['type'],
      interactionId: map['interactionId'],
      instanceId: map['instanceId'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': 'INTERACTION', // INTERACTION is required
      'type': getInteractionType(type),
      if(interactionId != null && interactionId != '') 'interactionId': interactionId,
      if(instanceId != null && instanceId != '') 'instanceId': instanceId,
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}
