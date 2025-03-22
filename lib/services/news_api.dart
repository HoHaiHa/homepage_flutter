import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_first_app/api/api_client.dart';
import 'package:my_first_app/models/news.dart';

class NewsService{
  final ApiClient _apiClient = ApiClient(Dio());

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





