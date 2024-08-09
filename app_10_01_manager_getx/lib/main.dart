import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'controllers/controller_main.dart';
import 'routes/app_pages.dart';

/*
dependencies:
  # BRUNO. https://pub.dev/packages/get/
  get: ^4.6.6
*/

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    final controllerMain = Get.put( ControllerMain() );

    // GetBuilder: deve envolver os componentes que sofrem update.
    return GetBuilder<ControllerMain>(
      builder: (context)
      {
        return GetMaterialApp(  // no lugar de MaterialApp
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            brightness: controllerMain.brightness,
          ),
          initialRoute: AppRoutes.pgHome, // informa quem é a pagina inicial ("/")
          getPages: AppPages().pages,     // informa onde as páginas estão sendo definidas
        );
      },
    );
  }
}
