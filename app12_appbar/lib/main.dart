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
  // Atributo, que vai ser inicializado com SharedPreference
  Brightness? brightness;

  @override
  void initState()
  {
    super.initState();
    brightness = CompTheme.getBrightness(); // inicializado com SharedPreference
  }

  // metodo que faz refresh para mudar tema
  void changeTheme(Brightness brightness)
  {
    this.brightness = brightness;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: brightness),
      // Estratégia: CallBack: Passar o método de refresh como parametro.
      home: PageHome(changeTheme),
    );
  }
}