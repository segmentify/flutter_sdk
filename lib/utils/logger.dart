// ignore_for_file: constant_pattern_never_matches_value_type, avoid_print

import '../constants/logger.dart';

class Logger {
  static Future<void> log({
    required String level,
    dynamic payload,
    String message = '',
  }) async {
    final messageUpper = message.toUpperCase();
    switch (level) {
      case 'ERROR':
        print('$ERROR_COLOR$messageUpper\x1B[0m $payload');
        break;
      case 'INFO':
        print('$INFO_COLOR$messageUpper\x1B[0m $payload');
        break;
      case 'SUCCESS':
        print('$SUCCESS_COLOR$messageUpper\x1B[0m $payload');
        break;
      case 'WARNING':
        print('$WARNING_COLOR$messageUpper\x1B[0m $payload');
        break;
      default:
        print('$INFO_COLOR$messageUpper\x1B[0m $payload');
        break;
    }
  }
}
