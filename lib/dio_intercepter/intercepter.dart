import 'package:dio/dio.dart';

class DioInterceptor {
  static Dio createDio() {
    Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Thêm token vào header
        options.headers['Authorization'] = "Bearer YOUR_TOKEN";
        print("🔵 Request: ${options.method} ${options.path}");
        return handler.next(options); // Chuyển tiếp request
      },
      onResponse: (response, handler) {
        print("🟢 Response: ${response.statusCode} ${response.data}");
        return handler.next(response); // Chuyển tiếp response
      },
      onError: (DioException e, handler) {
        print("🔴 Error: ${e.response?.statusCode} ${e.message}");
        // Xử lý token hết hạn (401)
        if (e.response?.statusCode == 401) {
          print("⚠️ Token hết hạn!");
          // Có thể thực hiện refresh token ở đây
        }
        return handler.next(e); // Chuyển tiếp lỗi
      },
    ));

    return dio;
  }
}
