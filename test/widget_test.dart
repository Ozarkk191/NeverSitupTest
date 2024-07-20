// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:never_situp_test/models/models.dart';
import 'package:never_situp_test/services/api.dart';

void main() {
  test('getDepartments', () async {
    final departments = await Api.getDepartments();
    expect(departments, isA<List<DepartmentModel>>());
  });

  test('getProductByDepartmentId', () async {
    final products = await Api.getProducts(departmentId: "1");
    expect(products, isA<List<ProductModel>>());
  });
}
