
import 'package:app_07_05_manager_get/controllers/controller_home.dart';
import 'package:app_07_05_manager_get/controllers/controller_main.dart';
import 'package:app_07_05_manager_get/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

class PageHome extends StatelessWidget
{
  final ControllerMain controllerMain = Get.find<ControllerMain>();
  final ControllerHome controllerHome = Get.find<ControllerHome>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageHome'),
      ),

      body: _body(),
    );
  }

  _body()
  {
    return ListView(
      children:
      [
        Text("Contador:"),
        SizedBox(height: 20),

        GetBuilder<ControllerHome>(builder: (context) {
          return Text("${controllerHome.valor}");
        }),
        SizedBox(height: 20),

        ElevatedButton(
            child: Text('+'),
            onPressed: () => controllerHome.inc()
        ),
        SizedBox(height: 20),

        ElevatedButton(
            child: Text('mudar tema'),
            onPressed: () => controllerMain.changeBrightness()
        ),
        SizedBox(height: 20),

        ElevatedButton(
            child: Text('ir para pagina1'),
            onPressed: () => Get.toNamed(AppRoutes.pg1),
        ),

      ],
    );
  }

}
