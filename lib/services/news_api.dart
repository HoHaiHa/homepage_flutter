import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/api/api_client.dart';
import 'package:my_first_app/di/di.dart';
import 'package:my_first_app/models/news.dart';

@singleton
class NewsService{
  //final _apiClient = getIt<ApiClient>();

  final ApiClient _apiClient ;

  NewsService()
      : _apiClient = ApiClient(Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  )));


  Future<List<News>> fetchNews() async{
    try{
      final response = await _apiClient.getNews();
      Map<String,dynamic> responseJson = jsonDecode(response);
      List<dynamic> listNewsString = responseJson['data'];
      List<News> listNews = listNewsString.map((news) => News.fromJson(news)).toList();
      return listNews;
    }
    catch(e){
      print("loi khi goi news: $e" );
      return [];
    }
  }
}





