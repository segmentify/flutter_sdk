// ignore_for_file: constant_identifier_names, camel_case_types

enum API_ERROR_ENUMS {
  NO_API_KEY,
  NO_ACCOUNT,
  UNVERIFIED_ACCOUNT,
  FAILED_ACCOUNT,
  NO_DOMAIN_APIKEY_MATCH,
  NO_EVENT,
  NO_USERID,
  NO_SESSIONID,
  BAD_INPUT,
}

Map<String, Map<String, dynamic>> API_ERRORS = {
  'NO_API_KEY': {
    'statusCode': API_ERROR_ENUMS.NO_API_KEY,
    'message':
        'Your request doesn\'t have an apiKey parameter, please provide apiKey parameter at the request with your account\'s unique api key.',
  },
  'NO_ACCOUNT': {
    'statusCode': API_ERROR_ENUMS.NO_ACCOUNT,
    'message':
        'Given api key is not associated with a Segmentify account, please check your api key value.',
  },
  'UNVERIFIED_ACCOUNT': {
    'statusCode': API_ERROR_ENUMS.UNVERIFIED_ACCOUNT,
    'message':
        'Account associated with api key is not a verified account. To verify your account, please check your email and verify it.',
  },
  'FAILED_ACCOUNT': {
    'statusCode': API_ERROR_ENUMS.FAILED_ACCOUNT,
    'message':
        'Account associated with api key is not an active account. Please contact with support team to re-activate your account.',
  },
  'NO_DOMAIN_APIKEY_MATCH': {
    'statusCode': API_ERROR_ENUMS.NO_DOMAIN_APIKEY_MATCH,
    'message':
        'Each Segmentify account is associated with a domain. Please check your domain and provide at requests with header Origin. Check Reqeust Details for required headers.',
  },
  'NO_EVENT': {
    'statusCode': API_ERROR_ENUMS.NO_EVENT,
    'message':
        'There is no events inside request body. You should add at least one event with each request.',
  },
  'NO_USERID': {
    'statusCode': API_ERROR_ENUMS.NO_USERID,
    'message':
        'Each Segmentify event should have an userId parameter, and at least one event in the request lacks this param',
  },
  'NO_SESSIONID': {
    'statusCode': API_ERROR_ENUMS.NO_SESSIONID,
    'message':
        'Each Segmentify event should have an sessionId parameter, and at least one event in the request lacks this param',
  },
  'BAD_INPUT': {
    'statusCode': API_ERROR_ENUMS.BAD_INPUT,
    'message':
        'Each Segmentify event should have an sessionId parameter, and at least one event in the request lacks this param',
  },
};

Map<String, dynamic> getApiError(String errorKey) {
  return API_ERRORS[errorKey] ?? {};
}

String getApiErrorMessage(String errorKey) {
  return API_ERRORS[errorKey]?['message'] ?? '';
}

int getApiErrorCode(String errorKey) {
  return API_ERRORS[errorKey]?['statusCode'] ?? 0;
}
