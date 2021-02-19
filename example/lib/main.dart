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
                AnsiLogger logger = AnsiLogger(90, "Box");
                logger.logBox(
                    "اشهد ان لا اله الا الله وان محمد رسول الله", false);
              },
            ),
            ElevatedButton(
              child: Text("Advanced log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger(90, "Advanced");
                logger.logBoxStart(false);
                logger.logString("إلا رسول الله صلي الله عليه وسلم", false);
                logger.logDashedLine(false);
                logger.logString("إلا رسول الله صلي الله عليه وسلم", false);
                logger.logSolidLine(false);
                logger.logString("إلا رسول الله صلي الله عليه وسلم", false);
                logger.logBoxLine(false);
                logger.logString("إلا رسول الله صلي الله عليه وسلم", false);
                logger.logBoxEnd(false);
              },
            ),
            ElevatedButton(
              child: Text("Json log"),
              onPressed: () {
                AnsiLogger logger = AnsiLogger(90, "Json");
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
                  false,
                  0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
