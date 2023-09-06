import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homegetbuilder.dart';

void main() => runApp(const GetMaterialApp(home: WidgetMain()));

class WidgetMain extends StatelessWidget {
  const WidgetMain({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeGetBuilder();
  }
}

