import 'dart:convert';

import 'package:dio/dio.dart';

import 'logger.dart';

// Dio Interceptor that can be used with Dio package
class AnsiDioInterceptor extends Interceptor {
  AnsiLogger logger;
  AnsiDioInterceptor(int length, [String name]) {
    logger = AnsiLogger(length, name ?? "Dio");
  }

  @override
  Future onError(DioError err) async {
    logger.logBoxStart(true);
    logger.logString(err.message, true);
    logger.logBoxEnd(true);
    if (err.response != null) onResponse(err.response);
    return err;
  }

  @override
  Future onResponse(Response response) async {
    var error = response.statusCode != 200 &&
        response.statusCode != 301 &&
        response.statusCode != 302;
    var url = response.request.uri.toString();
    //Log url
    logger.logBoxStart(error);
    logger.logString(url, error);
    logger.logDashedLine(error);
    logger.logString(
        "${response.statusCode.toString()} ╏ ${response.statusMessage}",
        error,
        response.request.method);
    //Query paramters
    logger.logHeader("Query paramters", error);
    logger.logJson(response.request.queryParameters, error, 0);

    //Log headers
    logger.logHeader("Request headers", error);
    response.request.headers.forEach((key, value) {
      logger.logString("$value", error, key);
    });

    //Log Data

    logger.logHeader("Request Data", error);
    if (response.request.data is FormData) {
      var frmData = (response.request.data as FormData);
      logger.logField("Fields", error);
      frmData.fields.forEach((element) {
        logger.logString(element.value, error, element.key);
      });
      logger.logDashedLine(error);
      logger.logField("Files", error);
      frmData.files.forEach((element) {
        logger.logString(element.value.filename, error, element.key);
      });
    } else if (response.request.data is Map)
      logger.logJson(response.request.data as Map<String, dynamic>, error, 0);
    else if (response.request.data is List)
      logger.logList("", response.request.data as List, error, 0);
    else
      logger.logString(response.request.data.toString(), error);

    //Log Response
    logger.logHeader("Response", error);
    _logResponse(response.data, error);
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
    } else if (res is Map)
      logger.logJson(res as Map<String, dynamic>, error, 0);
    else if (res is List)
      logger.logList("", res, error, 0);
    else
      logger.logString(res.toString(), error);
  }
}
