import 'package:flutter/material.dart';
import 'mapa_home.dart';

/*
  # BRUNO: GetX : Gerenciador de Estado: https://pub.dev/packages/get
  get: ^4.6.6

  # BRUNO: flutter_map : Renderizador de Mapa: https://pub.dev/packages/flutter_map
  flutter_map: ^7.0.2

  # BRUNO: google_polyline_algorithm : Polylines: https://pub.dev/packages/google_polyline_algorithm
  google_polyline_algorithm: ^3.1.0
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
          primaryColor: Colors.green
      ),
      home: new MapaHome(),
    );
  }
}



