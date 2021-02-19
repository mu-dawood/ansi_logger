import 'package:ansi_logger/src/http_response_logger.dart';
import 'package:test/test.dart';

void main() {
  test('Test http', () async {
    HttpLogger logger = HttpLogger(90, "HTTP");
    var result = await logger.logHttp(
      method: 'Get',
      queryParameters: {
        "Key1": "Value 1",
        "Key2": "Value 2",
      },
      requestHeaders: {
        "Key1": "Value 1",
        "Key2": "Value 2",
      },
      response: {
        "Key1": "Value 1",
        "Key2": "Value 2",
      },
      responseHeaders: {
        "Key1": "Value 1",
        "Key2": "Value 2",
      },
      statusCode: 200,
      statusMessage: 'Success',
      url: 'example.com',
    );
    expect(
        result,
        equals({
          "Key1": "Value 1",
          "Key2": "Value 2",
        }));
  });
}
