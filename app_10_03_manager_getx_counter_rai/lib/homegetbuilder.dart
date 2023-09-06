import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'homeobx.dart';
class HomeGetBuilder extends StatelessWidget {
  final ControllerGetBuilder controllerGetBuilder = Get.put(ControllerGetBuilder());

  HomeGetBuilder({super.key});

  @override
  Widget build(context) {
    List<Widget> listGetBuilder = List.generate(1000, (index) =>  GetBuilder(
  init: controllerGetBuilder,
  builder:(controller)=> Text("Clicks: ${controller.count}")),);

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text('clicks Get Builder')),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body:  SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ElevatedButton(
                    child: const Text("Go to Other"), 
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomeObx();
                    })),
                    ),
                  ...listGetBuilder
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: controllerGetBuilder.increment, child: Icon(Icons.add)));
  }
}
