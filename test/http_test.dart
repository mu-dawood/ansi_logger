import 'package:ansi_logger/ansi_logger.dart';
import 'package:test/test.dart';

void main() {
  test('Test http', () async {
    var logger = AnsiLogger();
    var result = await logger.logHttp(
      method: 'Get',
      queryParameters: {
        'Key1': 'Value 1',
        'Key2': {
          'Key21':
              'Value 1 sdkjshjdkshdjkhskjdhc hsdjhsdjfhjkdhfjbshdjkdhf jsjdhfjkdfhj hsdjkfhdjkfhj jsfjkdhjfkhd jkdhfjhdjkfh',
          'Key22': {
            'kets': 'sss',
          },
          'lsit': [
            'sjdhjsdhjkd',
            'sdjhsjkdh',
            true,
            1166,
            {'sss': 'mcnkdhckf'},
            ['sssjkchjskd', 'sdjhdjd']
          ],
        },
      },
      requestHeaders: {
        'Key1': 'Value 1',
        'Key2': 'Value 2',
      },
      response: {
        'Key1': 'Value 1',
        'Key2': 'Value 2',
      },
      responseHeaders: {
        'Key1': 'Value 1',
        'Key2': 'Value 2',
      },
      statusCode: 200,
      statusMessage: 'Success',
      url: 'example.com',
    );
    expect(
        result,
        equals({
          'Key1': 'Value 1',
          'Key2': 'Value 2',
        }));
  });

  test('Test json', () async {
    var logger = AnsiLogger();
    logger.logJson({
      'Key1': 'Value 1',
      'Key2': {
        'Key21':
            'Value 1 sdkjshjdkshdjkhskjdhc hsdjhsdjfhjkdhfjbshdjkdhf jsjdhfjkdfhj hsdjkfhdjkfhj jsfjkdhjfkhd jkdhfjhdjkfh',
        'Key22': {
          'kets': 'sss',
          'jsjjs': {},
        },
        'lsit': [
          'sjdhjsdhjkd',
          'sdjhsjkdh',
          true,
          1166,
          {'sss': 'mcnkdhckf'},
          ['sssjkchjskd', 'sdjhdjd']
        ],
      },
    });
  });
}
