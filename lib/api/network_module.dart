import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../interceptors/interceptors.dart';

@module
abstract class NetworkModule {
  @singleton
  Dio getDio(
      ConnectivityInterceptor connectivityInterceptor,
      TokenInterceptor tokenInterceptor,
      ResponseParserInterceptor responseParserInterceptor,
      ) {
    var dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ));

    dio.interceptors.addAll([
      connectivityInterceptor,
      tokenInterceptor,
      responseParserInterceptor,
    ]);

    return dio;
  }
}
