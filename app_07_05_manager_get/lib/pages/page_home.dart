
import 'package:app_07_05_manager_get/controllers/controller_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class PageHome extends StatelessWidget
{
  final ControllerHome controllerHome = Get.find<ControllerHome>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageHome'),
      ),

      body: _body(),

      floatingActionButton: FloatingActionButton(
        onPressed: controllerHome.incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _body()
  {
    return ListView(
      children:
      [
        Text("Contador de cliques no botão:"),

        GetBuilder(builder: (context) {
          return Text("${controllerHome.counter}");
        }),
      ],
    );
  }

}
