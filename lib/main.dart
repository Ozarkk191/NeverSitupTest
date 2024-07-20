import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Never Situp Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppPages.pages,
      initialRoute: Routes.home,
    );
  }
}

// class TestingApp extends StatelessWidget {
//   const TestingApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text("test"),
//         ),
//       ),
//     );
//   }
// }
