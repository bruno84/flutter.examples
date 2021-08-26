import 'package:flutter/material.dart';
import 'page_home.dart';
import 'utils/util_theme.dart';

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
  // Atributo que vai ser inicializado com SharedPreference
  Brightness? brightness;

  @override
  void initState()
  {
    super.initState();
    brightness = UtilTheme.getBrightness(); // inicializado com SharedPreference
  }

  // Crio método que recebe callback para mudar tema
  void changeTheme(Brightness brightness)
  {
    setState(() {
      this.brightness = brightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: brightness),
      // Passar referencia do método de callback
      home: PageHome(changeTheme),
    );
  }
}