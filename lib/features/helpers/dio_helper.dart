import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  DioHelper._();

  static void init() {
    _dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveTimeout: const Duration(seconds: 90),
        headers: {'lang': 'ar', 'Content-Type': 'application/json'}));
  }

  static Future<Response> getUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response = await _dio.get(Url, queryParameters: params, data: body);
    return response;
  }

  static Future<Response> postUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response = await _dio.post(Url, queryParameters: params, data: body);

    return response;
  }

  static Future<Response> putUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response = await _dio.put(Url, queryParameters: params, data: body);

    return response;
  }

  static Future<Response> patchUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response = await _dio.patch(Url, queryParameters: params, data: body);

    return response;
  }

  static Future<Response> delUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response =
        await _dio.delete(Url, queryParameters: params, data: body);

    return response;
  }

  static Future<Response> headUrls(
      {required String Url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? body}) async {
    final response = await _dio.head(Url, queryParameters: params, data: body);

    return response;
  }
}
