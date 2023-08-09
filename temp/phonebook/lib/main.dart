import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonebook/viewcreate.dart';
import 'package:phonebook/controller/controllercontact.dart';
import 'package:phonebook/binding/profilebinding.dart';
import 'package:phonebook/viewprofile.dart';
import 'package:phonebook/viewupdate.dart';

import 'binding/homepagebinding.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControllerContact());
    //------------- WARNING --------------
    // Binding Home não está carregando, nem sendo chamado o dependencies automaticante
    // [ Solução provisória ]
    // Binding Profile está [OK]
    return GetMaterialApp(
      title: 'Lista telefônica',
      initialRoute: HomePage.routeName,
      smartManagement: SmartManagement.onlyBuilder,
      getPages: [
        GetPage(
          //nome da rota
          name: HomePage.routeName,
          //tela - statelessWidget ou statefulWidget
          page: () => HomePage(),
          //binding informa quail controladores devem ser inicializados
          binding: HomePageBinding()
        ),
        GetPage(
          name: ViewAddContact.routeName,
          page: () => ViewAddContact()
        ),
        GetPage(
          name: ViewUpdateContact.routeName,
          page: () => ViewUpdateContact()
        ),
        GetPage(
          name: ViewProfile.routeName,
          page: () => ViewProfile(),
          binding: ProfileBinding()
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
      ),
      home: HomePage(),
    );
  }
}

