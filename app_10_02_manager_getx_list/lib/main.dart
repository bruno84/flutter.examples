import 'package:app_10_02_manager_get_list/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(Main());
}

// GetMaterialApp (em vez de MaterialApp)
// initialRoute: informa quem é a pagina inicial ("/")
// getPages: informa onde as páginas estão sendo definidas

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: AppRoutes.PG_LIST_HOME,
      getPages: AppPages().pages,
    );
  }
}
