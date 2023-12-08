enum OsTypes {
  android,
  ios,
}

String getOsType(OsTypes type) {
  switch (type) {
    case OsTypes.android:
      return 'android';
    case OsTypes.ios:
      return 'ios';
    default:
      throw Exception('Os type is not defined.');
  }
}

enum DeviceTypes {
  android,
  ios,
}

String getDeviceType(DeviceTypes type) {
  switch (type) {
    case DeviceTypes.android:
      return 'android';
    case DeviceTypes.ios:
      return 'ios';
    default:
      throw Exception('Device type is not defined.');
  }
}