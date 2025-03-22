import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:my_first_app/dio_intercepter/intercepter.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://13ae7061-8b70-40e1-b393-92845f68a909.mock.pstmn.io/")
abstract class ApiClient {
  static ApiClient? _instance;

  factory ApiClient() {
    _instance ??= _ApiClient(DioInterceptor.createDio());
    return _instance!;
  }

  @GET("/api/topics")
  Future<String> getTopics();

  @GET('/api/news')
  Future<String> getNews();
}
