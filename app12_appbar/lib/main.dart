import 'package:flutter/material.dart';
import 'page_home.dart';
import 'utils/theme.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget
{
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: CompTheme.getBrightness()
      ),
      home: PageHome(),
    );
  }
}