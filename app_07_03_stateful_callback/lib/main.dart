import 'package:flutter/material.dart';
import 'page_home.dart';
import 'controller_general.dart';

/*
  pubspec.yaml
  # Bruno: https://pub.dev/packages/shared_preferences
  shared_preferences: ^2.3.1
 */

/*
  Como ver os dados em SharedPreferences:
  1) View > Tool Windows > Device Explorer
  2) Procurar em:
      /data/data/YOUR_PACKAGE_NAME/shared_prefs/
      ou
      /data/data/YOUR_PACKAGE_NAME/files/datastore/
 */

void main() async
{
  // ensureInitialized: obrigatório usar quando main é async por usar await.
  /*
    OBS: se aqui você usar a mesma estratégia de page_home, a tela começa branca
     e só depois (piscada) muda para o valor armazenado em SharedPreferences.
   */
  WidgetsFlutterBinding.ensureInitialized();
  Brightness brightness = await ControllerGeneral.getBrightness();

  runApp( Main(brightness) );
}


// StatefulWidget: pois vai alterar "theme"
class Main extends StatefulWidget
{
  // Atributo da classe Main
  late Brightness brightness;

  Main( this.brightness );

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main>
{
  // Atributo que vai ser inicializado com SharedPreference
  Brightness? brightness;

  @override
  void initState() {
    brightness = widget.brightness;
    super.initState();
  }

  // Crio método que recebe callback para mudar tema
  void mudarTema(Brightness brightness)
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
      home: PageHome(mudarTema),
    );
  }
}