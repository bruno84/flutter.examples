
import 'package:app_07_05_manager_get/controllers/controller1.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class PagePg1 extends StatelessWidget
{
  final Controller1 controller1 = Get.find<Controller1>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagePg1'),
      ),

      body: ListView(children:
        [
          Text("Contador de cliques no botão:"),

          GetBuilder(builder: (context) {
            return Text("${controller1.counter}");
          }),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: controller1.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
