import 'package:dio/dio.dart';

class BooksDioHelper {
  static late Dio _dio;

  BooksDioHelper._();

  static void init() {
    _dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 90),
    ));
  }

  static Future<Response> getUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response = await _dio.get(Url, queryParameters: params, data: body);
    return response;
  }
}
