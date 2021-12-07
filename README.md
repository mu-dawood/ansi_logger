# ansi_logger

Pretty logger with ansi colors

## How to use

see the example

# Screenshots
<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/mo-ah-dawood/ansi_logger/main/screen_shots/black_1.png"></td>
    <td><img src="https://raw.githubusercontent.com/mo-ah-dawood/ansi_logger/main/screen_shots/black_2.png"></td>
    <td><img src="https://raw.githubusercontent.com/mo-ah-dawood/ansi_logger/main/screen_shots/black_3.png"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/mo-ah-dawood/ansi_logger/main/screen_shots/white_1.png"></td>
    <td><img src="https://raw.githubusercontent.com/mo-ah-dawood/ansi_logger/main/screen_shots/white_2.png"></td>
    <td><img src="https://raw.githubusercontent.com/mo-ah-dawood/ansi_logger/main/screen_shots/white_3.png"></td>
  </tr>
</table>

# Working with dio
- first create `Interceptor ` and override `onRequest` and `onError` method 

```dart

class _Interceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
     // See the example to know how to log this Error
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
     // See the example to know how to log this response
  }
}

```

- then you should use this Interceptor

```dart
 Dio dio = Dio();
 dio.interceptors.add(_Interceptor());
 dio.get("https://jsonplaceholder.typicode.com/todos/1");
 
```