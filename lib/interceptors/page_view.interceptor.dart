class IPageView {
  // Required Params
  String name;
  String category;

  // Optional Params
  String? subCategory;

  // Required Common Params
  String sessionId;
  String userId;
  String device;
  String os;
  String lang;

  IPageView({
    required this.name,
    required this.category,
    this.subCategory,
    required this.sessionId,
    required this.userId,
    required this.device,
    required this.os,
    required this.lang,
  });

  factory IPageView.fromMap(Map<String, dynamic> map) {
    return IPageView(
      name: map['name'],
      category: map['category'],
      subCategory: map['subCategory'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }
}
