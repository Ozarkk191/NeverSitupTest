import 'package:dio/dio.dart';
import 'package:never_situp_test/utils/constants/constant.dart';

class MyServices {
  static final dio = Dio();
  static const _path = "$baseUrl/api/v1";

  static Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await dio.get("$_path$path");
      return exceptionHandle(response);
    } on DioException catch (e) {
      if (e.response != null) {
        return exceptionHandle(e.response);
      } else {
        Map<String, dynamic> error = {
          massage: "ERROR",
        };
        return error;
      }
    }
  }

  static Future<Map<String, dynamic>> exceptionHandle(dynamic res) async {
    switch (res.statusCode) {
      case 200:
      case 201:
        return {massage: success, "data": res.data};
      case 400:
      case 404:
        return {massage: 'Data not found 404', "data": res.data};
      case 500:
        throw Exception('Server Error 500');
      default:
        throw Exception('Unknow Exception');
    }
  }
}
