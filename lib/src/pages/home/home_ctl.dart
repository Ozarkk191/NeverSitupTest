import 'package:get/get.dart';
import 'package:never_situp_test/models/department/department_model.dart';
import 'package:never_situp_test/models/product/product_model.dart';
import 'package:never_situp_test/services/api.dart';
import 'package:never_situp_test/utils/extensions/extension.dart';

class HomeCtl extends GetxController {
  static HomeCtl get to => Get.find();

  var departments = Rxn<List<DepartmentModel>>();
  var departmentSelected = Rxn<DepartmentModel>();
  var products = Rxn<List<ProductModel>>();

  @override
  void onInit() {
    getDepartment();
    super.onInit();
  }

  Future<void> getDepartment() async {
    departments.value = await Api.getDepartments();
    if (departments.value.isNotEmptyOrNull) {
      selectDepartment(departments.value!.first);
    }
    departments.refresh();
  }

  void selectDepartment(DepartmentModel department) async {
    departmentSelected.value = department;
    products.value = await Api.getProducts(departmentId: department.id ?? "");
    products.refresh();
    departmentSelected.refresh();
  }
}
