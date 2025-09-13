import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('--- Request ---');
    print('URI: ${options.uri}');
    print('Method: ${options.method}');
    print('Headers: ${options.headers}');
    if (options.data != null) print('Body: ${options.data}');
    print('---------------');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('--- Response ---');
    print('URI: ${response.requestOptions.uri}');
    print('Status Code: ${response.statusCode}');
    print('Data: ${response.data}');
    print('----------------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('--- Error ---');
    print('URI: ${err.requestOptions.uri}');
    print('Message: ${err.message}');
    if (err.response != null) {
      print('Status Code: ${err.response?.statusCode}');
      print('Data: ${err.response?.data}');
    }
    print('---------------');
    super.onError(err, handler);
  }
}
