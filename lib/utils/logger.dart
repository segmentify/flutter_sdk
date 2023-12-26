// ignore_for_file: constant_pattern_never_matches_value_type, avoid_print

import 'package:flutter_sdk/enums/LogLevels.enum.dart';

import '../constants/logger.dart';

class Logger {
  /// Logs a message with the specified log level and payload.
  ///
  /// The [level] parameter specifies the log level, which can be one of the values from the [LogLevels] enum.
  /// The [payload] parameter is optional and represents additional data to be logged.
  /// The [message] parameter is optional and allows you to provide a custom message to be logged.
  ///
  /// Example usage:
  /// ```dart
  /// await Logger.log(level: LogLevels.INFO, payload: 'Data loaded successfully');
  /// ```
  static Future<void> log({
    required LogLevels level,
    dynamic payload,
    String message = '',
  }) async {
    final messageUpper = message.toUpperCase();
    switch (level) {
      case LogLevels.ERROR:
        print('$ERROR_COLOR$messageUpper\x1B[0m $payload');
        break;
      case LogLevels.INFO:
        print('$INFO_COLOR$messageUpper\x1B[0m $payload');
        break;
      case LogLevels.SUCCESS:
        print('$SUCCESS_COLOR$messageUpper\x1B[0m $payload');
        break;
      case LogLevels.WARNING:
        print('$WARNING_COLOR$messageUpper\x1B[0m $payload');
        break;
      default:
        print('$INFO_COLOR$messageUpper\x1B[0m $payload');
        break;
    }
  }
}
