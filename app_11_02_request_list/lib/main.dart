import 'package:app_11_02_request_list/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/*
  # BRUNO: Requisicoes
  # https://pub.dev/packages/http
  http: ^1.2.2

  # BRUNO: Gerenciador de Estados
  # https://pub.dev/packages/get/
  get: ^4.6.6
 */

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      initialRoute: AppRoutes.PG_HOME,
      getPages: AppPages().pages,
    );
  }
}