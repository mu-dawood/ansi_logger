import 'dart:convert';

import 'ansi_colors.dart';
import 'dart:developer' as developer;

/// Advanced ansi logger
class AnsiLogger {
  final int length;
  final String name;
  final AnsiColors stringColor;
  final AnsiColors borderColor;
  final AnsiColors decorationColor;
  AnsiLogger({
    this.length = 90,
    this.name = 'ANSI',
    this.stringColor = AnsiColors.blue,
    this.borderColor = AnsiColors.green,
    this.decorationColor = AnsiColors.yellow,
  });
  AnsiLogger copyWith({
    int? length,
    String? name,
    AnsiColors? stringColor,
    AnsiColors? borderColor,
    AnsiColors? decorationColor,
  }) {
    return AnsiLogger(
      length: length ?? this.length,
      name: name ?? this.name,
      stringColor: stringColor ?? this.stringColor,
      borderColor: borderColor ?? this.borderColor,
      decorationColor: decorationColor ?? this.decorationColor,
    );
  }

  String _getLine(String str, [String? prefex = '', String? suffix = '']) {
    var _str = '';
    while (_stringWidth('$prefex$_str$suffix') <= length) {
      _str += str;
    }
    return '$prefex$_str$suffix';
  }

  /// ═ symbol repeated with length
  String get doubleLine => '═';

  /// ━ symbol repeated with length
  String get solidLine => '─';

  /// Log developer message
  void log(String str) {
    developer.log(
      str,
      name: name,
      sequenceNumber: 100,
      stackTrace: null,
    );
  }

  /// Log box line with end curves

  void logBoxEnd() => log(borderColor.colorize(_getLine(solidLine, '└', '┘')));
  void logBoxStart() =>
      log(borderColor.colorize(_getLine(solidLine, '┌', '┐')));
  void logSolidLine() =>
      log(borderColor.colorize(_getLine(solidLine, '├', '┤')));
  void logSpliter() => log(borderColor.colorize(_getLine(' ', '|', '|')));
  void logDoubleLine() =>
      log(borderColor.colorize(_getLine(doubleLine, '├', '┤')));

  /// Log string wrapped by box
  void logBox(String str) {
    logBoxStart();
    logString(str);
    logBoxEnd();
  }

  /// Log box line with start curves
  String _getEncodable(Object item) {
    try {
      return jsonEncode(item);
    } catch (e) {
      return item.toString();
    }
  }

  /// Log pretty string

  void logString(String str, [String? prefex]) {
    var prefexWidth = _stringWidth(prefex ?? '');
    var _prefexSpace = '';
    while ((_stringWidth(_prefexSpace)) < prefexWidth) {
      _prefexSpace += ' ';
    }
    var i = 0;
    str.split('\n').forEach((element) {
      _logString(element, i == 0 ? prefex : _prefexSpace);
      i++;
    });
  }

  void _logString(String str, [String? prefex]) {
    var maxWidth = length - 2;
    var _prefex = prefex == null || prefex.trim().isEmpty
        ? List.filled((prefex?.length ?? 0), ' ').join('')
        : '$prefex: ';
    var space = ' ';
    var strWidth = _stringWidth('╎ $_prefex$str ╎');

    if (strWidth < maxWidth) {
      var _space = '';
      while ((_stringWidth('╎ $_prefex$str$_space ╎')) <= length) {
        _space += space;
      }
      log("${borderColor.colorize('╎')} ${decorationColor.colorize(_prefex)}${stringColor.colorize('$str$_space')} ${borderColor.colorize('╎')}");
      return;
    }
    var prefexWidth = _stringWidth(_prefex);
    var _prefexSpace = '';
    while ((_stringWidth(_prefexSpace)) < prefexWidth) {
      _prefexSpace += space;
    }
    var _index = 0;
    var _firstLine = true;
    while (_index < str.length) {
      var _line = '';
      var _pref = _firstLine ? _prefex : _prefexSpace;
      while ((_stringWidth('╎ $_pref$_line ╎')) <= length) {
        _line += _index < str.length ? str[_index] : space;
        _index++;
      }
      log("${borderColor.colorize('╎')} ${decorationColor.colorize(_pref)}${stringColor.colorize(_line)} ${borderColor.colorize('╎')}");
    }
  }

  /// Logging list of items
  void logList(List list, [int count = 0, String? key, addComma = false]) {
    var prefex = count == 0 ? '' : "${List.filled(count, ' ').join("")}";
    var _key = key == null ? '' : '"$key"';
    var space = '  ';
    logString(decorationColor.colorize('['), '$prefex$_key');
    for (var item in list) {
      if (item is Map) {
        logJson(item, count + space.length, null, true);
      } else if (item is List) {
        logList(item, count + space.length, null, true);
      } else {
        logString(_getEncodable(item) + decorationColor.colorize(','),
            '$space$prefex');
      }
    }
    logString(decorationColor.colorize('$prefex]${(addComma ? ',' : '')}'));
  }

  /// Log json object
  void logJson(Map json, [int count = 0, String? key, bool addComma = false]) {
    var prefex = count == 0 ? '' : "${List.filled(count, ' ').join("")}";
    if (json.isEmpty) {
      logString(decorationColor.colorize('{}'), '$prefex');
    } else {
      var _key = key == null ? '' : '"$key"';
      var space = '  ';
      logString(decorationColor.colorize('{'), '$prefex$_key');
      json.forEach((key, value) {
        if (value is Map) {
          logJson(value, count + space.length, key, true);
        } else if (value is List) {
          logList(value, count + space.length, key, true);
        } else {
          logString(_getEncodable(value) + decorationColor.colorize(','),
              '$space$prefex"$key"');
        }
      });
      logString(
          decorationColor.colorize('}${(addComma ? ',' : '')}'), '$prefex');
    }
  }

  int _stringWidth(String str) {
    if (str.isEmpty) {
      return 0;
    }
    final ansiPattern = RegExp([
      '[\\u001B\\u009B][[\\]()#;?]*(?:(?:(?:[a-zA-Z\\d]*(?:;[-a-zA-Z\\d\\/#&.:=?%@~_]*)*)?\\u0007)',
      '(?:(?:\\d{1,4}(?:;\\d{0,4})*)?[\\dA-PR-TZcf-ntqry=><~]))'
    ].join('|'));
    var string = str.replaceAll(ansiPattern, '');
    if (string.isEmpty) {
      return 0;
    }
    string = string..replaceAll(emojiRegex(), '  ');
    var width = 0;

    for (var i = 0; i < string.length; i++) {
      var code = string.codeUnitAt(i);
      if (code <= 0x1F || (code >= 0x7F && code <= 0x9F)) {
        continue;
      }

      if (code >= 0x300 && code <= 0x36F) {
        continue;
      }

      if (code > 0xFFFF) {
        i++;
      }

      width += isFullwidthCodePoint(code) ? 2 : 1;
    }

    return width;
  }

  Pattern emojiRegex() {
    return RegExp(
        r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  }

  bool isFullwidthCodePoint(int codePoint) {
    return codePoint >= 0x1100 &&
        (codePoint <= 0x115F || // Hangul Jamo
            codePoint == 0x2329 || // LEFT-POINTING ANGLE BRACKET
            codePoint == 0x232A || // RIGHT-POINTING ANGLE BRACKET
            // CJK Radicals Supplement .. Enclosed CJK Letters and Months
            (0x2E80 <= codePoint &&
                codePoint <= 0x3247 &&
                codePoint != 0x303F) ||
            // Enclosed CJK Letters and Months .. CJK Unified Ideographs Extension A
            (0x3250 <= codePoint && codePoint <= 0x4DBF) ||
            // CJK Unified Ideographs .. Yi Radicals
            (0x4E00 <= codePoint && codePoint <= 0xA4C6) ||
            // Hangul Jamo Extended-A
            (0xA960 <= codePoint && codePoint <= 0xA97C) ||
            // Hangul Syllables
            (0xAC00 <= codePoint && codePoint <= 0xD7A3) ||
            // CJK Compatibility Ideographs
            (0xF900 <= codePoint && codePoint <= 0xFAFF) ||
            // Vertical Forms
            (0xFE10 <= codePoint && codePoint <= 0xFE19) ||
            // CJK Compatibility Forms .. Small Form Variants
            (0xFE30 <= codePoint && codePoint <= 0xFE6B) ||
            // Halfwidth and Fullwidth Forms
            (0xFF01 <= codePoint && codePoint <= 0xFF60) ||
            (0xFFE0 <= codePoint && codePoint <= 0xFFE6) ||
            // Kana Supplement
            (0x1B000 <= codePoint && codePoint <= 0x1B001) ||
            // Enclosed Ideographic Supplement
            (0x1F200 <= codePoint && codePoint <= 0x1F251) ||
            // CJK Unified Ideographs Extension B .. Tertiary Ideographic Plane
            (0x20000 <= codePoint && codePoint <= 0x3FFFD));
  }
}
