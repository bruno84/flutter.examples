import 'package:app_11_01_request/page_home.dart';
import 'package:flutter/material.dart';

/*
  pubspec.yaml:
  # BRUNO: http (para realizar requisições)
  http: ^1.2.2
 */

/*
  JSON to DART (opções):
  https://javiercbk.github.io/json_to_dart/
  https://quicktype.io/dart
  https://dart-quicktype.netlify.app/
  https://app.quicktype.io/
*/

/*
  API de teste:
  As classes de model foram baseadas na API de teste:
  https://jsonplaceholder.typicode.com/todos/
  OBS: só adicionei as mudanças do null safety.
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
      home: PageHome(),
    );
  }
}