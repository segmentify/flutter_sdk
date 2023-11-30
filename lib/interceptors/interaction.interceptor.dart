class IInteraction {
  // Required Params
  String name;
  String type;

  // Optional Params
  String? interactionId;
  String? instanceId;

  // Required Common Params
  String sessionId;
  String userId;
  String device;
  String os;
  String lang;

  IInteraction({
    required this.name,
    required this.type,
    this.interactionId,
    this.instanceId,
    required this.sessionId,
    required this.userId,
    required this.device,
    required this.os,
    required this.lang,
  });

  factory IInteraction.fromMap(Map<String, dynamic> map) {
    return IInteraction(
      name: map['name'],
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
}
