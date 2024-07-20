import 'package:flutter/material.dart';
import 'package:never_situp_test/src/src.dart';

import '../../models/models.dart';

class DepartmentWidget extends StatelessWidget {
  final DepartmentModel department;
  final bool active;
  final Function(DepartmentModel department) onTap;
  const DepartmentWidget({
    super.key,
    required this.department,
    required this.onTap,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(department);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        clipBehavior: Clip.antiAlias,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: active
              ? Border.all(
                  width: 5,
                  color: Colors.blue,
                )
              : null,
        ),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: ImageWidget(
                imageUrl: department.imageUrl ?? "",
                height: 100,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.1),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: const [0.1, 0.7],
                  ),
                ),
                child: Text(
                  department.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
