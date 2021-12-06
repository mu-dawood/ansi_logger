import 'dart:developer' as developer;

class Std {
  static bool get supportAnsi {
    return false;
  }

  static int? terminalColumns() {
    return null;
  }

  static void log(List<String> messages) {
    var _messages = messages.join();
    developer.log(_messages);
  }
}
