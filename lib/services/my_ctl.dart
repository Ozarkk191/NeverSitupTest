import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyCtl<T extends GetxController> extends StatelessWidget {
  final String? tag = null;
  const MyCtl({super.key});
  T get c => GetInstance().find<T>(tag: tag);
}
