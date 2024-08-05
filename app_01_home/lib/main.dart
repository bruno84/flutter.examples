import 'package:flutter/material.dart';
import 'page_home.dart';

void main() {
  runApp(MyApp());
}

// Dica: "new" é opcional em Dart.
// Dica: shift+F6 = atalho para rename de identificadores.

// StatelessWidget : Widget em que nao há alteração de estado.
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // MaterialApp : define que a aplicacao vai usar material design.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // theme: parametros mais comuns: brightness, primaryColor e primarySwatch
          primaryColor: Colors.green
      ),
      home: new PageHome(),   // home : widget principal.
    );
  }
}



