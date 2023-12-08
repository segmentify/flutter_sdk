class PageViewModel {
  // Required Params
  String category;

  // Optional Params
  String? subCategory;

  // Required Common Params
  String? sessionId;
  String? userId;
  String? device;
  String? os;
  String? lang;

  PageViewModel({
    required this.category,
    this.subCategory,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  factory PageViewModel.fromMap(Map<String, dynamic> map) {
    return PageViewModel(
      category: map['category'],
      subCategory: map['subCategory'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': 'PAGE_VIEW', // PAGE_VIEW is required
      'category': category,
      if(subCategory != null && subCategory != '') 'subCategory': subCategory,
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}
