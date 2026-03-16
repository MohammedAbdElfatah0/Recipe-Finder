import 'package:dio/dio.dart';

class DioClient {
  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() {
    return _instance;
  }

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://www.themealdb.com/api/json/v1/1/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}