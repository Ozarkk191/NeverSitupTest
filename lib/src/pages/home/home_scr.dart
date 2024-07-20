import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/services.dart';
import '../../src.dart';

class HomeScr extends MyCtl<HomeCtl> {
  const HomeScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          var depertment = c.departments.value;
          var selected = c.departmentSelected.value;
          var products = c.products.value;
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Department carousel",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: depertment == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : depertment.isEmpty
                          ? const Center(
                              child: Text(
                                "Data Not Found",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              scrollDirection: Axis.horizontal,
                              itemCount: depertment.length,
                              itemBuilder: (context, index) {
                                return DepartmentWidget(
                                  active: selected == depertment[index],
                                  onTap: (department) {
                                    c.products.value = null;
                                    c.selectDepartment(department);
                                  },
                                  department: depertment[index],
                                );
                              },
                            ),
                ),
              ),
              if (selected != null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Product list : ${selected.name}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              if (products == null) ...{
                if (selected != null)
                  SizedBox(
                    width: Get.width,
                    height: 350,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ).sliverBox,
              } else ...{
                if (products.isEmpty) ...{
                  SizedBox(
                    width: Get.width,
                    height: 350,
                    child: const Center(
                      child: Text(
                        "Data Not Found",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ).sliverBox,
                } else ...{
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ProductWidget(
                            product: products[index],
                            onTap: (product) {
                              Get.dialog(
                                Dialog(
                                  child: Container(
                                    width: Get.width * 0.8,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    product.name ?? "",
                                                    style: const TextStyle(fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                const SizedBox(height: 16),
                                                Text(
                                                  product.desc ?? "",
                                                  style: const TextStyle(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => Get.back(),
                                          child: Container(
                                            height: 50,
                                            width: Get.width * 0.8,
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Close",
                                                style: TextStyle(fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                barrierDismissible: false,
                              );
                            },
                          );
                        },
                        childCount: products.length,
                      ),
                    ),
                  ),
                }
              },
              const SizedBox(height: 60).sliverBox,
            ],
          );
        }),
      ),
    );
  }
}
