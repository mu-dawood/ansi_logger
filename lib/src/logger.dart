import 'dart:convert';

import 'ansi_colors.dart';
import 'dart:developer' as developer;

import 'dart:math' as math;

// Advanced ansi logger
class AnsiLogger {
  final int length;
  final String name;
  AnsiLogger(this.length, this.name);
  // ═ symbol repeated with length
  String get line => List.filled(length, '═').join("");
  // ┄ symbol repeated with length
  String get dashedLine => List.filled(length, '┄').join("");
  // ━ symbol repeated with length
  String get solidLine => List.filled(length, '━').join("");

  String _getGreen(String str) => "${AnsiColor.green(str)}";
  String _getMagenta(String str) => "${AnsiColor.magenta(str)}";
  String _getBlue(String str) => "${AnsiColor.blue(str)}";

  String _getRed(String str) => "${AnsiColor.red(str)}";
  // Log developer message
  void log(String str) {
    developer.log(str, name: name, stackTrace: null);
  }
  // Log box line with end curves

  void logBoxEnd(bool error) => log(_getWrappers("╚$line╝", error));
  // Log string wrapped by box
  void logBox(String str, bool error) {
    logBoxStart(error);
    logString(str, error);
    logBoxEnd(error);
  }

  // Log box line with start curves
  void logBoxStart(bool error) => log(_getWrappers("╔$line╗", error));

  void logSolidLine(bool error) => log(_getWrappers("╠$solidLine╣", error));
  void logDashedLine(bool error) => log(_getWrappers("╠$dashedLine╣", error));
  void logBoxLine(bool error) => log(_getWrappers("╠$line╣", error));
  String _getEncodable(Object item) {
    try {
      return jsonEncode(item);
    } catch (e) {
      return jsonEncode(item.toString());
    }
  }

  // Log string between to lines and has prefex `╠╍╾`
  void logHeader(String name, bool error) {
    logSolidLine(error);
    log(_getWrappers("╠╍╾", error) + _getMagenta(" $name"));
    logSolidLine(error);
  }

  // Log blue string that has prefex `╠╍╾`
  void logField(String name, bool error) {
    log(_getWrappers("╠╍╾", error) + _getBlue(" $name"));
  }

// Log list of items

  void logList(String key, List list, bool err, [int count = 0]) {
    var prefex = count == 0 ? "" : "${List.filled(count, ' ').join("")}";
    logString(AnsiColor.yellow("["), err, "$prefex$key");
    for (var item in list) {
      if (item is Map) {
        logJson("", item, err, count + 2);
      } else if (item is List)
        logList("", item, err, count + 2);
      else {
        logString(_getEncodable(item) + AnsiColor.blue(","), err, "  $prefex");
      }
    }
    logString(AnsiColor.yellow("$prefex]") + AnsiColor.blue(","), err);
  }

  String _getWrappers(String str, bool error) {
    if (error)
      return _getRed(str);
    else
      return _getGreen(str);
  }
// Log pretty string

  void logString(String str, bool error, [String prefex]) {
    _logString(str.replaceAll("\n", "⏎").replaceAll("\r", "⏎"), error, prefex);
  }

  void _logString(String str, bool error, [String prefex]) {
    int maxWidth = length - 2;
    var _prefex = prefex == null || prefex.trim().isEmpty
        ? List.filled((prefex?.length ?? 0), " ").join("")
        : "$prefex: ";
    if ((str.length + _prefex.length) < maxWidth) {
      log("${_getWrappers('╏', error)} ${AnsiColor.yellow(_prefex)}${AnsiColor.cyan(str)}");
      return;
    }
    maxWidth -= _prefex.length;
    int lines = (str.length / length).ceil();
    var space = List.filled(_prefex.length, " ").join("");
    for (int i = 0; i < lines; ++i) {
      var line =
          "${str.substring(i * maxWidth, math.min<int>(i * maxWidth + maxWidth, str.length))}";
      var box = i == 0 ? "╭" : (i < lines - 1 ? "┆" : "╰");
      if (i == 0) {
        line =
            "${_getWrappers('╏', error)} ${AnsiColor.yellow(_prefex)}${AnsiColor.magenta(box)} ${AnsiColor.cyan(line)}";
      } else {
        line =
            "${_getWrappers('╏', error)} ${AnsiColor.yellow(space)}${AnsiColor.magenta(box)} ${AnsiColor.cyan(line)}";
      }
      log(line);
    }
  }

// Log json object
  void logJson(String key, Map<String, dynamic> json, bool err,
      [int count = 0]) {
    var prefex = count == 0 ? "" : "${List.filled(count, ' ').join("")}";
    if (json.isEmpty) {
      logString(AnsiColor.yellow("{}"), err, "$prefex");
    } else {
      logString(AnsiColor.yellow("{"), err, '$prefex"$key"');
      json.forEach((key, value) {
        if (value is Map) {
          logJson(key, value, err, count + 2);
        } else if (value is List) {
          logList(key, value, err, count + 2);
        } else
          logString(_getEncodable(value) + AnsiColor.blue(","), err,
              '   $prefex"$key"');
      });
      logString(AnsiColor.yellow("},"), err, '$prefex');
    }
  }
}
