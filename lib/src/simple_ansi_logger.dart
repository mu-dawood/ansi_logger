import 'package:ansi_logger/src/ansi_colors.dart';

import 'std_io.dart' if (dart.library.html) 'std_web.dart';

class SimpleAnsiLogger {
  /// Log text with paased color
  static void log(AnsiColors color, String v) {
    Std.log([color.colorize(v)]);
  }
}
