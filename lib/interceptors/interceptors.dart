import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("ConnectivityInterceptor: Requesting ${options.uri}");
    super.onRequest(options, handler);
  }
}

@singleton
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer your_token';
    print("TokenInterceptor: Added token to ${options.uri}");
    super.onRequest(options, handler);
  }
}

@singleton
class ResponseParserInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("ResponseParserInterceptor: Parsing response from ${response.requestOptions.uri}");
    super.onResponse(response, handler);
  }
}
