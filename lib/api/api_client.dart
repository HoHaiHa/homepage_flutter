import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: "https://13ae7061-8b70-40e1-b393-92845f68a909.mock.pstmn.io/")
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/api/topics")
  Future<String> getTopics();

  @GET('/api/news')
  Future<String> getNews();
}