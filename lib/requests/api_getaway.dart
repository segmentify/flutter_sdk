import 'package:dio/dio.dart';
import 'package:flutter_sdk/enums/LogLevels.enum.dart';
import '../constants/request.dart';
import '../constants/api_errors.dart';
import '../utils/storage.dart';
import '../utils/logger.dart';
import '../utils/account_config_getter.dart';

/// This class represents an API service that handles HTTP requests.
/// It provides a method to create a Dio instance with customized options and interceptors.
/// Creates a Dio instance with customized options and interceptors.
///
/// The Dio instance is configured with a connect timeout of [API_GET_AWAY_TIME_OUT] milliseconds.
/// It also adds an interceptor that sets the necessary headers for the API request.
/// Additionally, it includes interceptors for handling the response and error cases.
///
/// Returns the created Dio instance.
///
/// Example usage:
/// ```dart
/// final apiService = ApiService();
/// final dio = apiService.createDio();
/// ```
class ApiService {
  Dio createDio() {
    var dio = Dio();

    dio.options.connectTimeout =
        const Duration(milliseconds: API_GET_AWAY_TIME_OUT);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers = {
          'X-Sfy-Api-Key': await getApiKey(),
          'Origin': await getSubDomain(),
          'Accept': 'application/json',
          'Content-Type': 'text/plain',
        };

        return handler.next(options);
      },
      onResponse: (response, handler) async {
        final loggerEnabled = await getStorageItem(key: 'logger');
        // show type of loggerEnabled
        if (loggerEnabled == 'true') {
          Logger.log(
            level: LogLevels.INFO,
            message: 'Response Interceptor: ',
            payload: response,
          );
        }
        final responseData = response.data;
        var responseStatusCode = '';
        if (responseData is Map && responseData.containsKey('statusCode')) {
          responseStatusCode = responseData['statusCode'];
        }

        if (responseStatusCode != 'SUCCESS' &&
            (responseData is Map && responseData.containsKey('statusText'))) {
          response.data.message = getApiErrorMessage(responseStatusCode);
          response.statusMessage = 'ERROR';
          response.statusCode = 400;
        }
        response.statusMessage = 'SUCCESS';

        return handler.next(response);
      },
      onError: (DioException error, handler) async {
        if ((error.type == DioExceptionType.connectionTimeout ||
                error.type == DioExceptionType.sendTimeout ||
                error.type == DioExceptionType.receiveTimeout) &&
            error.message!.contains('timeout')) {
          final loggerEnabled = await getStorageItem(key: 'logger');
          if (loggerEnabled == 'true') {
            Logger.log(
              level: LogLevels.ERROR,
              message: 'Response Interceptor Error: ',
              payload: 'Request timed out',
            );
          }
        } else {
          Logger.log(
            level: LogLevels.ERROR,
            message: 'Response Interceptor Error: ',
            payload: error.message,
          );
        }
        return handler.reject(error);
      },
    ));

    return dio;
  }
}
