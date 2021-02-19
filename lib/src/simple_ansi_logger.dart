import 'dart:developer' as developer;

class SimpleAnsiLogger {
  /// Log text with blue color
  static void logRed(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[31m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with black color
  static void logBlack(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[30m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with green color
  static void logGreen(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[32m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with yellow color
  static void logYellow(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[33m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with blue color
  static void logBlue(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[34m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with magenta color
  static void logMagenta(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[35m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with cyan color
  static void logCyan(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[36m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }

  /// Log text with white color
  static void logWhite(String v, [String? name]) {
    developer.log('\u001b[0m\u001b[37m$v',
        name: name ?? 'Ansi', stackTrace: null);
  }
}
