// ignore_for_file: constant_pattern_never_matches_value_type, avoid_print

import 'package:flutter_sdk/enums/LogLevels.enum.dart';

import '../constants/logger.dart';

class Logger {
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
