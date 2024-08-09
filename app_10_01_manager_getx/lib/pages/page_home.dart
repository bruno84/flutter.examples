import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

import '../controllers/controller_home.dart';
import '../controllers/controller_main.dart';
import '../routes/app_pages.dart';

class PageHome extends StatelessWidget
{
  final ControllerHome controllerHome = Get.find<ControllerHome>();
  final ControllerMain controllerMain = Get.find<ControllerMain>();

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

  // IMPORTANTE: não esqueça do generic do GetBuilder! Ex: <ControllerHome>
  _body()
  {
    return ListView(
      children:
      [
        Text("Contador:"),
        SizedBox(height: 20),

        // _ = quando não for preciso usar o contexto
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
