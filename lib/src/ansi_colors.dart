// Default ansi color for logger
class AnsiColor {
  // Wrap text with red color
  static String red(String v) => "\u001b[0m\u001b[31m$v";
  // Wrap text with black color
  static String black(String v) => "\u001b[0m\u001b[30m$v";
  // Wrap text with green color
  static String green(String v) => "\u001b[0m\u001b[32m$v";
  // Wrap text with yellow color
  static String yellow(String v) => "\u001b[0m\u001b[33m$v";
  // Wrap text with blue color
  static String blue(String v) => "\u001b[0m\u001b[34m$v";
  // Wrap text with magenta color
  static String magenta(String v) => "\u001b[0m\u001b[35m$v";
  // Wrap text with cyan color
  static String cyan(String v) => "\u001b[0m\u001b[36m$v";
  // Wrap text with white color
  static String white(String v) => "\u001b[0m\u001b[37m$v";
  // reset color
  static String resetWith(String v) => "\u001b[0m$v";
  // Wrap text with grey color
  static String hint(String v) => "\u001b[0m\u001b[38;5;${240}m$v";
}
