import 'dart:developer' as developer;
import 'dart:io';

class Std {
  static bool get supportAnsi {
    return stdout.hasTerminal ? stdout.supportsAnsiEscapes : true;
  }

  static int? terminalColumns() {
    if (!stdout.hasTerminal) return null;
    return stdout.terminalColumns;
  }

  static void log(List<String> messages) {
    if (stdout.hasTerminal) {
      for (var message in messages) {
        stdout.write(message);
      }
      stdout.writeln();
    } else {
      var _messages = messages.join();
      developer.log(_messages);
    }
  }
}
