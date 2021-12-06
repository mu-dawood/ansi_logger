import 'ansi_colors.dart';
import 'std_io.dart' if (dart.library.html) 'std_web.dart';

/// Advanced ansi logger
class AnsiLogger {
  final int? length;
  final AnsiColors stringColor;
  final AnsiColors borderColor;
  final AnsiColors prefexColor;
  final AnsiColors seperatorColor;
  int getLength() {
    return length ?? Std.terminalColumns() ?? 90;
  }

  AnsiLogger({
    this.length,
    this.stringColor = AnsiColors.blueJeans,
    this.borderColor = AnsiColors.harlequinGreen,
    this.prefexColor = AnsiColors.grey39,
    this.seperatorColor = AnsiColors.sage,
  });
  AnsiLogger copyWith({
    int? length,
    String? name,
    AnsiColors? stringColor,
    AnsiColors? borderColor,
    AnsiColors? prefexColor,
    AnsiColors? seperatorColor,
  }) {
    return AnsiLogger(
      length: length ?? this.length,
      stringColor: stringColor ?? this.stringColor,
      borderColor: borderColor ?? this.borderColor,
      prefexColor: prefexColor ?? this.prefexColor,
      seperatorColor: seperatorColor ?? this.seperatorColor,
    );
  }

  String _getLine(String str, [String? prefex = '', String? suffix = '']) {
    var _str = '';
    var max = getLength();
    while (_stringWidth('$prefex$_str$suffix') <= max) {
      _str += str;
    }
    return '$prefex$_str$suffix';
  }

  /// ═ symbol repeated with length
  String get doubleLine => '═';

  /// ━ symbol repeated with length
  String get solidLine => '─';

  /// Log developer message
  void log(List<String> messages) {
    Std.log(messages);
  }

  /// Log box line with end curves

  void logBoxEnd() => log([borderColor.colorize(_getLine(solidLine, '└', '┘'))]);
  void logBoxStart() => log([borderColor.colorize(_getLine(solidLine, '┌', '┐'))]);
  void logSolidLine() => log([borderColor.colorize(_getLine(solidLine, '├', '┤'))]);
  void logSpliter() => log([borderColor.colorize(_getLine(' ', '|', '|'))]);
  void logDoubleLine() => log([borderColor.colorize(_getLine(doubleLine, '├', '┤'))]);

  /// Log string wrapped by box
  void logBox(String str) {
    logBoxStart();
    logString(str);
    logBoxEnd();
  }

  /// Log pretty string

  void logString(
    String str, {
    String prefex = '',
    String separator = '',
  }) {
    var forceSpace = false;
    str.split('\n').forEach((element) {
      _logString(
        element,
        prefex: prefex,
        separator: separator,
        forceSpace: forceSpace,
      );
      forceSpace = true;
    });
  }

  void _logString(
    String str, {
    String prefex = '',
    String separator = '',
    required bool forceSpace,
  }) {
    var maxWidth = getLength();
    var space = ' ';
    var _prefex = prefex;
    var _separator = separator;

    var _index = 0;
    var _showSpaceInstead = forceSpace;
    while (_index <= str.length) {
      var _line = '';
      while ((_stringWidth('╎ $_prefex$separator$_line ╎')) <= maxWidth) {
        _line += _index < str.length ? str[_index] : space;
        _index++;
      }
      if (_showSpaceInstead) {
        _prefex = List.filled(_prefex.length, space).join();
        _separator = List.filled(_separator.length, space).join();
      }
      log([
        borderColor.colorize('╎ '),
        if (_prefex.isNotEmpty) prefexColor.colorize(_prefex),
        if (_separator.isNotEmpty) seperatorColor.colorize(_separator),
        if (_line.isNotEmpty) stringColor.colorize(_line),
        borderColor.colorize(' ╎'),
      ]);

      _showSpaceInstead = true;
    }
  }

  /// Logging list of items
  void logList(List list) => _logList(list);
  void _logList(
    List list, {
    int spaces = 0,
    String key = '',
  }) {
    var comma = key.isNotEmpty ? seperatorColor.colorize(',') : '';
    var prefex = List.filled(spaces, ' ').join();
    if (list.isEmpty) {
      logString(prefexColor.colorize('[]') + comma, prefex: '$prefex$key', separator: key.isEmpty ? '' : ' : ');
    } else {
      logString(prefexColor.colorize('['), prefex: '$prefex$key', separator: key.isEmpty ? '' : ' : ');

      list.forEach((value) {
        if (value is Map) {
          _logJson(
            value,
            key: '(Map)',
            spaces: spaces + 3,
          );
        } else if (value is List) {
          _logList(
            value,
            key: '(List)',
            spaces: spaces + 3,
          );
        } else {
          logString(value.toString() + comma, prefex: '   $prefex');
        }
      });
      logString(prefexColor.colorize(']') + comma, prefex: prefex);
    }
  }

  /// Log json object
  void logJson(Map json) {
    _logJson(json);
  }

  void _logJson(
    Map json, {
    int spaces = 0,
    String key = '',
  }) {
    var comma = key.isNotEmpty ? seperatorColor.colorize(',') : '';
    var prefex = List.filled(spaces, ' ').join();
    if (json.isEmpty) {
      logString(prefexColor.colorize('{}') + comma, prefex: '$prefex$key', separator: key.isEmpty ? '' : ' : ');
    } else {
      logString(prefexColor.colorize('{'), prefex: '$prefex$key', separator: key.isEmpty ? '' : ' : ');

      json.forEach((_key, value) {
        if (value is Map) {
          _logJson(
            value,
            key: _key,
            spaces: spaces + 3,
          );
        } else if (value is List) {
          _logList(
            value,
            key: _key,
            spaces: spaces + 3,
          );
        } else {
          logString(value.toString() + comma, prefex: '   $prefex$_key', separator: ' : ');
        }
      });
      logString(prefexColor.colorize('}') + comma, prefex: prefex);
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
    return RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])');
  }

  bool isFullwidthCodePoint(int codePoint) {
    return codePoint >= 0x1100 &&
        (codePoint <= 0x115F || // Hangul Jamo
            codePoint == 0x2329 || // LEFT-POINTING ANGLE BRACKET
            codePoint == 0x232A || // RIGHT-POINTING ANGLE BRACKET
            // CJK Radicals Supplement .. Enclosed CJK Letters and Months
            (0x2E80 <= codePoint && codePoint <= 0x3247 && codePoint != 0x303F) ||
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
