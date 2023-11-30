import 'package:dio/dio.dart';
import '../constants/request.dart';
import '../constants/api_errors.dart';
import '../utils/storage.dart';
import '../utils/logger.dart';
import '../utils/account_config_getter.dart';

class ApiService {
  Dio createDio() {
    print('ApiService: createDio');
    var dio = Dio();

    dio.options.connectTimeout =
        const Duration(milliseconds: API_GET_AWAY_TIME_OUT);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        print('ApiService: onRequest');
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
        print('ApiService: onResponse - $loggerEnabled');
        // show type of loggerEnabled
        print('ApiService: onResponse type - ${loggerEnabled.runtimeType}');
        if (loggerEnabled == 'true') {
          Logger.log(
            level: 'INFO',
            message: 'Response Interceptor: ',
            payload: response,
          );
        }
        print('Response - 1:');
        final responseData = response.data;
        print('Response responseData: $responseData');
        var responseStatusCode = '';
        if (responseData is Map && responseData.containsKey('statusCode')) {
          responseStatusCode = responseData['statusCode'];
        }
        // print('Response responseStatusCode - 2: $responseStatusCode');
        if (responseStatusCode != 'SUCCESS' &&
            (responseData is Map && responseData.containsKey('statusText'))) {
          print('Response - 2.1');
          response.data.message = getApiErrorMessage(responseStatusCode);
          print('Response - 2.2');
          response.statusMessage = 'ERROR';
          print('Response - 2.3');
          response.statusCode = 400;
          print('Response - 2.4');
        }
        print('Response - 3');
        response.statusMessage = 'SUCCESS';
        print('Response - 4');
        print('Response: $response');
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
              level: 'ERROR',
              message: 'Response Interceptor Error: ',
              payload: 'Request timed out',
            );
          }
        } else {
          Logger.log(
            level: 'ERROR',
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
