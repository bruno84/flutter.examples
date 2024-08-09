import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class HomeObx extends StatelessWidget
{
  final ControllerObx controllerObx = Get.put(ControllerObx());

  @override
  Widget build(context)
  {
    // Obx( () => atualiza o widget quando o atributo observado (.obs) é alterado.
    List<Widget> listObx = List.generate(100, (index) =>  Obx(
        () => Text("Clicks: ${controllerObx.count}")
      )
    );

    return Scaffold(
      appBar: AppBar(title: Text('Usando Obx')),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ElevatedButton(
                child: Text("Mudar para GetBuilder"),
                onPressed: () => Navigator.pop(context)
            ),
            ...listObx  // concatena a lista
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add), onPressed: controllerObx.increment));
  }
}