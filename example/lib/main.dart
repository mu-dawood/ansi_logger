import 'dart:convert';
import 'dart:math';

import 'package:ansi_logger/ansi_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Simple log"),
              onPressed: () {
                SimpleAnsiLogger.log(AnsiColors.red, "حبيبي يارسول الله");
              },
            ),
            ElevatedButton(
              child: Text("Box log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger();
                logger.logBox(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                );
              },
            ),
            ElevatedButton(
              child: Text("Advanced log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger();
                logger.logBoxStart();
                logger.logString("إلا رسول الله صلي الله عليه وسلم");
                logger.logSpliter();
                logger.logString("إلا رسول الله صلي الله عليه وسلم");
                logger.logSolidLine();
                logger.logString(
                  "إلا رسول الله صلي الله عليه وسلم",
                );
                logger.logDoubleLine();
                logger.logString(
                  "إلا رسول الله صلي الله عليه وسلم",
                );
                logger.logBoxEnd();
              },
            ),
            ElevatedButton(
              child: Text("Json log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger();
                logger.logBoxStart();
                logger.logJson(
                  {
                    "key_1": "Value 1",
                    "key_t": {},
                    "Key_2": {
                      "Sub_key_1": 7,
                      "Sub_key_2": {
                        "Sub_key": "Sub value",
                      }
                    },
                    "List": [
                      "Value 1",
                      true,
                      {"Key": "Value"},
                      [
                        true,
                        false,
                        1,
                        "Text",
                        DateTime.now(),
                      ]
                    ],
                  },
                );
                logger.logBoxEnd();
              },
            ),
            ElevatedButton(
              child: Text("Log http"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger();
                logger.logHttp(
                  url: "http://site.com",
                  statusMessage: "Done",
                  method: "Get",
                  statusCode: 400,
                  queryParameters: {
                    "key1": 1,
                    "key2": "Value",
                  },
                  requestHeaders: {
                    "key1": 1,
                    "key2": "Value",
                  },
                  responseHeaders: {
                    "key1": 1,
                    "key2": "Value",
                  },
                  files: [
                    IFile("filename1", "key", 76767676),
                    IFile("filename2", "key", 76767676),
                    IFile("filename3", "key", 76767676),
                  ],
                  requestData: {
                    "key1": 1,
                    "key2": "Value",
                  },
                  response: {
                    "key1": 1,
                    "key2": "Value",
                  },
                );
              },
            ),
            ElevatedButton(
              child: Text("Dio"),
              onPressed: () {
                Dio dio = Dio();
                dio.interceptors.add(_Interceptor());

                dio.get("https://jsonplaceholder.typicode.com/todos/1");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Interceptor extends Interceptor {
  final logger = AnsiLogger();
  DateTime? _start;
  String? get _duration {
    if (_start == null) return 'without duration ➤ ';
    var duration = DateTime.now().difference(_start!).inMilliseconds;
    return '$duration MS ➤ ';
  }

  dynamic tryGetMap(dynamic data) {
    try {
      if (data is String) {
        return jsonDecode(data);
      } else {
        return data;
      }
    } catch (e) {
      return data;
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (!kDebugMode) return;
    logger.logBox('Got error ${err.requestOptions.uri} at ${DateTime.now()}');
    dynamic requestData;
    List<IFile>? files;
    if (err.requestOptions.data is FormData) {
      var fd = err.requestOptions.data as FormData;
      requestData = {};
      for (var element in fd.fields) {
        requestData[element.key] = element.value;
      }
      files = [];
      for (var k in fd.files) {
        files.add(IFile(k.value.filename ?? '', k.key, k.value.length));
      }
    } else {
      requestData = err.requestOptions.data;
    }

    logger.logHttp(
      url: err.requestOptions.uri.toString(),
      statusMessage: '$_duration${err.response?.statusMessage}',
      method: err.requestOptions.method,
      statusCode: err.response?.statusCode ?? 0,
      queryParameters: err.requestOptions.queryParameters,
      requestHeaders: err.requestOptions.headers,
      responseHeaders: err.response?.headers.map ?? {},
      response: tryGetMap(err.response?.data),
      requestData: requestData,
      files: files,
    );
  }

  static String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + ' ' + suffixes[i];
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    if (!kDebugMode) return;
    logger.logBox('Got response ${response.requestOptions.uri} at ${DateTime.now()}');
    dynamic requestData;
    List<IFile>? files;
    if (response.requestOptions.data is FormData) {
      var fd = response.requestOptions.data as FormData;
      requestData = {};
      for (var element in fd.fields) {
        requestData[element.key] = element.value;
      }
      files = [];
      for (var k in fd.files) {
        files.add(IFile(k.value.filename ?? '', k.key, k.value.length));
      }
    } else {
      requestData = response.requestOptions.data;
    }
    var bytes = _formatBytes(utf8.encode('${response.data}').length, 2);
    logger.logHttp(
      url: response.requestOptions.uri.toString(),
      statusMessage: '$bytes ➤ $_duration${response.statusMessage}',
      method: response.requestOptions.method,
      statusCode: response.statusCode ?? 0,
      queryParameters: response.requestOptions.queryParameters,
      requestHeaders: response.requestOptions.headers,
      responseHeaders: response.headers.map,
      response: tryGetMap(response.data),
      requestData: requestData,
      files: files,
    );
  }
}
