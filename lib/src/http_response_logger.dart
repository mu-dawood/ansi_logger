import 'dart:convert';
import 'dart:math';

import 'logger.dart';

class IFile {
  final String filename;
  final String key;
  final int length;

  IFile(this.filename, this.key, this.length);
}

/// http logger helper
class HttpLogger {
  late AnsiLogger logger;
  HttpLogger(int length, [String? name]) {
    logger = AnsiLogger(length, name ?? 'HTTP');
  }

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

    ///Log url
    logger.logBoxStart(error);
    logger.logString(url, error);
    logger.logDashedLine(error);
    logger.logString(
        '${statusCode.toString()} ╏ ${statusMessage}', error, method);

    ///Query paramters
    logger.logHeader('Query paramters', error);
    logger.logJson(queryParameters, error, 0);

    ///Log headers
    logger.logHeader('Request headers', error);
    requestHeaders.forEach((key, value) {
      logger.logString('$value', error, key);
    });

    ///Log Data
    logger.logHeader('Request Data', error);
    if (files != null) {
      var totalSize = files.fold<int>(
          0, (previousValue, element) => previousValue + element.length);
      logger.logField('Files: ${_formatBytes(totalSize)}', error);
      files.forEach((element) {
        logger.logString(
            '${element} (${_formatBytes(element.length)})', error, element.key);
      });
      logger.logDashedLine(error);
      logger.logField('Fields', error);
    }
    if (requestData != null) {
      if (requestData is Map) {
        logger.logJson(requestData, error, 0);
      } else if (requestData is List) {
        logger.logList(requestData, error, 0);
      } else {
        logger.logString(requestData.toString(), error);
      }
    }

    ///Log Response
    logger.logHeader('Response', error);
    _logResponse(response, error);
    logger.logBoxEnd(error);

    return response;
  }

  void _logResponse(dynamic res, bool error) {
    if (res is String) {
      try {
        _logResponse(jsonDecode(res), error);
      } catch (e) {
        logger.logString(res, error);
      }
    } else if (res is Map) {
      logger.logJson(res as Map<String, dynamic>, error, 0);
    } else if (res is List) {
      logger.logList(res, error, 0);
    } else {
      logger.logString(res.toString(), error);
    }
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
