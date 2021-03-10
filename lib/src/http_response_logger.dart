import 'dart:convert';
import 'dart:math';

import 'ansi_colors.dart';
import 'logger.dart';

class IFile {
  final String filename;
  final String key;
  final int length;

  IFile(this.filename, this.key, this.length);
}

/// http logger helper
extension HttpLoggerExtnsion on AnsiLogger {
  Future logHttp({
    required String url,
    required String statusMessage,
    required String method,
    required int statusCode,
    required Map<String, dynamic> queryParameters,
    required Map<String, dynamic> requestHeaders,
    required Map<String, dynamic> responseHeaders,
    dynamic requestData,
    required dynamic response,
    List<IFile>? files,
  }) async {
    var error = statusCode != 200 &&
        statusCode != 301 &&
        statusCode != 201 &&
        statusCode != 302;
    var logger = error ? copyWith(borderColor: AnsiColors.red) : this;

    ///Log url
    logger.logBoxStart();
    logger.logString(url);
    logger.logSpliter();
    logger.logString('${statusCode.toString()} ➤ ${statusMessage}', method);

    ///Query paramters
    logger.logSolidLine();
    logger
        .copyWith(stringColor: AnsiColors.magenta)
        .logString('Query paramters');
    logger.logSpliter();
    logger.logJson(queryParameters);

    ///Log headers
    logger.logSolidLine();
    logger
        .copyWith(stringColor: AnsiColors.magenta)
        .logString('Request headers');
    logger.logSpliter();
    logger.logJson(requestHeaders);

    ///Log Data
    logger.logSolidLine();
    logger.copyWith(stringColor: AnsiColors.magenta).logString('Request Data');
    logger.logSpliter();
    if (files != null) {
      var totalSize = files.fold<int>(
          0, (previousValue, element) => previousValue + element.length);
      logger
          .copyWith(stringColor: AnsiColors.cyan)
          .logString('Files: ${_formatBytes(totalSize)}');
      logger.logSpliter();
      files.forEach((element) {
        logger.logString(
            '${element.filename} (${_formatBytes(element.length)})',
            element.key);
      });
      logger.logSpliter();
      logger.copyWith(stringColor: AnsiColors.cyan).logString('Fields');
      logger.logSpliter();
    }
    if (requestData != null) {
      if (requestData is Map) {
        logger.logJson(requestData, 0);
      } else if (requestData is List) {
        logger.logList(requestData, 0);
      } else {
        logger.logString(requestData.toString());
      }
    }

    ///Log Response headers
    logger.logSolidLine();
    logger
        .copyWith(stringColor: AnsiColors.magenta)
        .logString('Response headers');
    logger.logSpliter();
    logger.logJson(responseHeaders);

    ///Log Response
    logger.logSolidLine();
    logger.copyWith(stringColor: AnsiColors.magenta).logString('Response');
    if (response != null) {
      if (response is Map) {
        logger.logJson(response, 0);
      } else if (response is List) {
        logger.logList(response, 0);
      } else {
        try {
          logger.logJson(jsonDecode(response));
        } catch (e) {
          logger.logString(response.toString());
        }
      }
    }
    logger.logBoxEnd();

    return response;
  }

  static String _formatBytes(int bytes) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(2).replaceAll('.00', '')) +
        ' ' +
        suffixes[i];
  }
}
