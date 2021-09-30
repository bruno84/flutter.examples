import 'package:app_14_02_geocoding/page_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
1. Console: https://cloud.google.com/maps-platform/
1.1. Criar novo projeto OU usar o mesmo projeto que foi criado para usar o Firebase.
1.2. Maps SDK for Android -> Ativar
1.3. Criar uma chave ou usar
1.4. Copiar a chave

2. AndroidManifest.xml (android/app/src/main/)
2.1. Cole a chave neste arquivo:
<manifest ...
  <application ...

    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>

    <activity ...

 */


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
      home: PageHome(),
    );
  }
}