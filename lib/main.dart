import 'package:fetch_api_getx/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller_binding.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinding(),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
