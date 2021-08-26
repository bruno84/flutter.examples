import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/page_login.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  // brightness: light ou dark
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light
      ),
      home: PageLogin(),
    );
  }
}