import 'package:app_09_02_modal_pick/page_home.dart';
import 'package:flutter/material.dart';

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