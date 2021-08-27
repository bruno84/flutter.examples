import 'package:app_07_04_manager_provider/page_home.dart';
import 'package:app_07_04_manager_provider/providers/provider_contador.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  // brightness: light ou dark
  @override
  Widget build(BuildContext context) {
    return ProviderContador(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light
        ),
        home: PageHome(),
      ),
    );
  }
}