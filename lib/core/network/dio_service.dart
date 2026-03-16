import 'package:dio/dio.dart';

import 'dio_client.dart';

class DioService {
  final Dio _dio = DioClient().dio;
  
  
  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }


}
