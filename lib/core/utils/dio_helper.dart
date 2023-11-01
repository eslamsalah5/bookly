import 'package:bookly/core/utils/end_point.dart';
import 'package:dio/dio.dart';

class DioHelper {
   final Dio dio;

  DioHelper(this.dio);

Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
