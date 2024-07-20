import 'package:never_situp_test/services/my_services.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class Api {
  static Future<List<ProductModel>> getProducts({required String departmentId}) async {
    Map<String, dynamic> res = await MyServices.get('/departments/$departmentId/products');
    List<ProductModel> list = [];
    if (res[massage] == success) {
      List<dynamic> listData = res["data"];
      list = listData.map((e) => ProductModel.fromJson(e)).toList();
    }
    return list;
  }

  static Future<List<DepartmentModel>> getDepartments() async {
    Map<String, dynamic> res = await MyServices.get('/departments');
    if (res[massage] == success) {
      List<dynamic> listData = res["data"];
      return listData.map((e) => DepartmentModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
