import 'package:get/get.dart';

import '../../src/src.dart';
import '../utils.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScr(),
      binding: BindingsBuilder(
        () {
          Get.put<HomeCtl>(HomeCtl());
        },
      ),
    ),
  ];
}
