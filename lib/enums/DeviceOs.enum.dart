/// Device OS enum
enum OsTypes {
  android,
  ios,
}

/// Get OS type
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

/// Device type enum
enum DeviceTypes {
  android,
  ios,
}

/// Get device type
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
