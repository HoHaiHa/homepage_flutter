import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:my_first_app/api/api_client.dart';

class TopicService {
  final ApiClient _apiClient = ApiClient(Dio());

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

