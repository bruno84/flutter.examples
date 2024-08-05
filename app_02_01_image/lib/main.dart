import 'package:flutter/material.dart';
import 'page_home.dart';

/*
    HABILITAR ASSETS:
      1) Criar pastas: assets/images/
      2) Editar: pubspec.yaml:
      3) Descomentar: "assets:" e "- assets/images/" com identacao
      4) Clicar em "Get dependecies"
      5) Se não funcionar: Tools -> Flutter -> flutter clean
  */

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home: new PageHome(),
    );
  }
}