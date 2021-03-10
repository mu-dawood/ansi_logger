import 'package:ansi_logger/ansi_logger.dart';
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
                SimpleAnsiLogger.logGreen("حبيبي يارسول الله");
              },
            ),
            ElevatedButton(
              child: Text("Box log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger(name: "Box");
                logger.logBox(
                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                );
              },
            ),
            ElevatedButton(
              child: Text("Advanced log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger(name: "Advanced");
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
                AnsiLogger logger = AnsiLogger(name: "Json");
                logger.logBoxStart();
                logger.logJson(
                  {
                    "key_1": "Value 1",
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
          ],
        ),
      ),
    );
  }
}
