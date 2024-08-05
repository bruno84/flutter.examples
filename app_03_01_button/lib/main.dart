import 'package:flutter/material.dart';
import 'page_home.dart';

/*
  pubspec.yaml
  dependencies:
    fluttertoast: ^8.2.6
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