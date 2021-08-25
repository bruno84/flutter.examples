import 'package:flutter/material.dart';
import 'page_home.dart';

void main() {
  runApp(Main());
}

// StatelessWidget : Widget em que nao há alteração de estado.

// MaterialApp : define que a aplicacao vai usar material design.
// theme: parametros mais comuns: brightness, primaryColor e primarySwatch
// home : widget principal.

// Dica: "new" é opcional em Dart.
// Dica: shift+F6 = atalho para rename de identificadores.
class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green
      ),
      home: new PageHome(),
    );
  }
}



