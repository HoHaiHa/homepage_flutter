import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/api/api_client.dart';
import 'package:my_first_app/di/di.dart';

@singleton
class TopicService {
  //final _apiClient = getIt<ApiClient>();


  final ApiClient _apiClient ;

  TopicService()
      : _apiClient = ApiClient(Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
  )));


  Future<List<String>> fetchTopics() async {
    try {
      final response = await _apiClient.getTopics();
      Map<String, dynamic> responseJson = jsonDecode(response);
      List<String> listTopics = List<String>.from(
          responseJson['data'].map((e) => e['topic'].toString())
      );
      return listTopics;
    } catch (e) {
      print("Lỗi khi gọi API: $e");
      return [];
    }
  }
}

