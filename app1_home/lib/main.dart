import 'package:flutter/material.dart';
import 'page_home.dart';

void main() {
  runApp(MyApp());
}

// StatelessWidget : nao gerencia estados.
// MaterialApp : define que a aplicacao vai usar material design.
// theme: prevalece sobre os componentes internos.
// home : widget principal.
// OBS: "new" é opcional em Dart.
class MyApp extends StatelessWidget
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



