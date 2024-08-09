import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'homeobx.dart';

class HomeGetBuilder extends StatelessWidget
{
  final ControllerGetBuilder controllerGetBuilder = Get.put(ControllerGetBuilder());

  @override
  Widget build(context)
  {
    // GetBuilder : atualiza o widget quando update() é chamado.
    List<Widget> listGetBuilder = List.generate(100, (index) =>  GetBuilder(
        init: controllerGetBuilder,
        builder: (controller) => Text("Clicks: ${controller.count}")
      )
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Usando GetBuilder')),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Mudar para Obx"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeObx() ) ),
            ),
            ...listGetBuilder   // concatena a lista
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: controllerGetBuilder.increment, child: Icon(Icons.add)));
  }
}