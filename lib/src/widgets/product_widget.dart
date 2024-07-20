import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:never_situp_test/models/product/product_model.dart';
import 'package:never_situp_test/src/src.dart';
import 'package:never_situp_test/utils/extensions/extension.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel product) onTap;
  const ProductWidget({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(product),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 7,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ImageWidget(
                width: Get.width,
                imageUrl: product.imageUrl ?? "",
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      product.desc ?? "",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Price ${double.parse(product.price ?? "0").toNumberFormat}",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
