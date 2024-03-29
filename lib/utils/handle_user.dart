import '../utils/storage.dart';
import '../requests/request.dart';

/// This code handles the user data in the application.
/// It checks if the required user fields (userId and sessionId) are present in the storage.
/// If both fields are missing, it requests the user to provide both credentials.
/// If either userId or sessionId is missing, it requests the user to provide the missing credential.
/// After receiving the credentials, it updates the storage with the user data.
///
/// Example usage:
/// ```dart
/// await initialUserHandler();
/// ```
Future<dynamic> initialUserHandler() async {
  SegmentifyEvent segmentifyEvent = SegmentifyEvent();
  final storageUser = await getStorageItem(key: 'sgm_user');
  var requiredFields = 0;
  requiredFields = 2;

  final isUserIdExist = storageUser != null &&
      storageUser.containsKey('userId') &&
      storageUser['userId'] != null &&
      storageUser['userId'] != '';
  final isSessionIdExist = storageUser != null &&
      storageUser.containsKey('sessionId') &&
      storageUser['sessionId'] != null &&
      storageUser['sessionId'] != '';

  if (!isUserIdExist && !isSessionIdExist) {
    requiredFields = 2;
    List<dynamic> credentials =
        await segmentifyEvent.requestCredentials(requiredFields);

    final userId = credentials[0];
    final sessionId = credentials[1];

    setStorageItem(key: 'sgm_user', value: {
      'userId': userId.toString(),
      'sessionId': sessionId.toString(),
    });
  } else if (!isUserIdExist || !isSessionIdExist) {
    requiredFields = 1;
    List<dynamic> credentials =
        await segmentifyEvent.requestCredentials(requiredFields);

    if (!isUserIdExist) {
      setStorageItem(key: 'sgm_user', value: {
        'userId': credentials[0].toString(),
        'sessionId': storageUser['sessionId']
      });
    } else if (!isSessionIdExist) {
      setStorageItem(key: 'sgm_user', value: {
        'userId': storageUser['userId'],
        'sessionId': credentials[0].toString(),
      });
    }
  }
}
