import 'package:app_10_01_manager_get/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'controllers/controller_main.dart';

void main() {
  runApp(Main());
}

// GetMaterialApp (em vez de MaterialApp)
// initialRoute: informa quem é a pagina inicial ("/")
// getPages: informa onde as páginas estão sendo definidas

// GetBuilder: deve envolver os componentes que sofrem update.

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    final controllerMain = Get.put( ControllerMain() );

    return GetBuilder<ControllerMain>(
      builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            brightness: controllerMain.brightness,
          ),
          initialRoute: AppRoutes.pgHome,
          getPages: AppPages().pages,
        );
      },
    );
  }
}
