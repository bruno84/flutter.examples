import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
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
    return GetMaterialApp(  // no lugar de MaterialApp
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: AppRoutes.PG_LIST_HOME, // informa quem é a pagina inicial ("/")
      getPages: AppPages().pages, // informa onde as páginas estão sendo definidas
    );
  }
}
