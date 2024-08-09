import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/binding_home.dart';
import 'binding/binding_perfil.dart';
import 'controller/controller_contato.dart';
import 'page_home.dart';
import 'page_create.dart';
import 'page_perfil.dart';
import 'page_update.dart';

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
    Get.put(ControllerContato());

    return GetMaterialApp(
      title: 'Lista de contatos',
      initialRoute: PageHome.nomeRota,
      smartManagement: SmartManagement.onlyBuilder,
      home: PageHome(),

      getPages: [
        GetPage(
          name: PageHome.nomeRota,
          page: () => PageHome(),
          binding: BindingHome()
        ),
        GetPage(
          name: PageCreate.nomeRota,
          page: () => PageCreate()
        ),
        GetPage(
          name: PageUpdate.nomeRota,
          page: () => PageUpdate()
        ),
        GetPage(
          name: PagePerfil.nomeRota,
          page: () => PagePerfil(),
          binding: BindingPerfil()
        ),
      ],

      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            color: Colors.black87
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.black87
          )
        )
      )

    );
  }
}

