import '../utils/storage.dart';
import '../requests/request.dart';

Future<dynamic> initialUserHandler() async {
  SegmentifyEvent segmentifyEvent = SegmentifyEvent();
  final storageUser = await getStorageItem(key: 'user');
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

    setStorageItem(key: 'user', value: {
      'userId': userId.toString(),
      'sessionId': sessionId.toString(),
    });
  } else if (!isUserIdExist || !isSessionIdExist) {
    requiredFields = 1;
    List<dynamic> credentials =
        await segmentifyEvent.requestCredentials(requiredFields);

    if (!isUserIdExist) {
      setStorageItem(key: 'user', value: {
        'userId': credentials[0].toString(),
        'sessionId': storageUser['sessionId']
      });
    } else if (!isSessionIdExist) {
      setStorageItem(key: 'user', value: {
        'userId': storageUser['userId'],
        'sessionId': credentials[0].toString(),
      });
    }
  }
}
