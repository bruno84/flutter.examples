import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomeObx extends StatelessWidget {
  final ControllerObx controllerObx = Get.put(ControllerObx());

  @override
  Widget build(context) {
    List<Widget> listObx = List.generate(1000, (index) =>  Obx(
  ()=> Text("Clicks: ${controllerObx.count}")),);

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text('clicks Obx')),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ElevatedButton(
                    child: Text("Go to Other"), 
                    onPressed: () => Navigator.pop(context)
                    ),
                  ...listObx
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: controllerObx.increment));
  }
}