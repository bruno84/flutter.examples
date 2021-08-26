
import 'package:app_07_05_manager_get/controllers/controller2.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class PagePg2 extends StatelessWidget
{
  final Controller2 controller2 = Get.find<Controller2>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagePg2'),
      ),

      body: ListView(children:
      [
        Text("Contador de cliques no botão:"),

        GetBuilder(builder: (context) {
          return Text("${controller2.counter}");
        }),
      ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: controller2.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
