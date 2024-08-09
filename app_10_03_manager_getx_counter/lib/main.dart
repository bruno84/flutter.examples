import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homegetbuilder.dart';

/*
dependencies:
  # BRUNO. https://pub.dev/packages/get/
  get: ^4.6.6
*/

// Dica: https://medium.com/@hpatilabhi10/getx-obx-vs-getbuilder-in-flutter-a-comprehensive-guide-d99d32754063


void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(  // no lugar de MaterialApp
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomeGetBuilder()
    );
  }
}