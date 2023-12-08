enum UserOperationSteps {
  SIGN_UP,
  SIGN_IN,
  SIGN_OUT,
  UPDATE,
}

String getUserOperationStep(UserOperationSteps step) {
  switch (step) {
    case UserOperationSteps.SIGN_UP:
      return 'signup';
    case UserOperationSteps.SIGN_IN:
      return 'signin';
    case UserOperationSteps.SIGN_OUT:
      return 'signout';
    case UserOperationSteps.UPDATE:
      return 'update';
    default:
      throw Exception('User operation step is not defined.');
  }
}

class UserOperationModel {
  // Required Params
  UserOperationSteps step;

  // Optional Params
  String? username;
  String? fullName;
  String? email;
  String? phone;
  String? gender;
  String? age;
  String? birthdate;
  String? memberSince;
  String? location;
  List<String>? segments;
  bool? isLogin;
  bool? isRegistered;

  // Required Common Params
  String? sessionId;
  String? device;
  String? os;
  String? userId;
  String? lang;

  UserOperationModel({
    required this.step,
    this.username,
    this.fullName,
    this.email,
    this.phone,
    this.gender,
    this.age,
    this.birthdate,
    this.memberSince,
    this.location,
    this.segments,
    this.isLogin,
    this.isRegistered,
    this.sessionId,
    this.userId,
    this.device,
    this.os,
    this.lang,
  });

  factory UserOperationModel.fromMap(Map<String, dynamic> map) {
    return UserOperationModel(
      step: map['step'],
      username: map['username'],
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      gender: map['gender'],
      age: map['age'],
      birthdate: map['birthdate'],
      memberSince: map['memberSince'],
      location: map['location'],
      segments: map['segments'],
      isLogin: map['isLogin'],
      isRegistered: map['isRegistered'],
      sessionId: map['sessionId'],
      userId: map['userId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': 'USER_OPERATIONS', // USER_OPERATIONS is required
      'step': getUserOperationStep(step),
      if(username != null && username != '') 'username': username,
      if(fullName != null && fullName != '') 'fullName': fullName,
      if(email != null && email != '') 'email': email,
      if(phone != null && phone != '') 'phone': phone,
      if(gender != null && gender != '') 'gender': gender,
      if(age != null && age != '') 'age': age,
      if(birthdate != null && birthdate != '') 'birthdate': birthdate,
      if(memberSince != null && memberSince != '') 'memberSince': memberSince,
      if(location != null && location != '') 'location': location,
      if(segments != null) 'segments': segments,
      if(isLogin != null) 'isLogin': isLogin,
      if(isRegistered != null) 'isRegistered': isRegistered,
      'sessionId': sessionId,
      'userId': userId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}

class UserChangeModel {
  // Required Params
  String oldUserId;
  String userId;

  // Required Common Params
  String? sessionId;
  String? device;
  String? os;
  String? lang;

  UserChangeModel({
    required this.oldUserId,
    required this.userId,
    this.sessionId,
    this.device,
    this.os,
    this.lang,
  });

  factory UserChangeModel.fromMap(Map<String, dynamic> map) {
    return UserChangeModel(
      oldUserId: map['oldUserId'],
      userId: map['userId'],
      sessionId: map['sessionId'],
      device: map['device'],
      os: map['os'],
      lang: map['lang'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': 'USER_CHANGE', // USER_CHANGE is required
      'oldUserId': oldUserId,
      'userId': userId,
      'sessionId': sessionId,
      'device': device,
      'os': os,
      'lang': lang,
    };
  }
}