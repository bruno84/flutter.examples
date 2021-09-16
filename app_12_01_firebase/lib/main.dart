import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/page_login.dart';

void main() async
{
  // Bruno: FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Main());
}

/*
FIREBASE:
1) Como conseguir o SHA1:
keytool -list -v -keystore C:\Users\{User}\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android

2) Firebase: E-mail para Suporte

3) Projeto Firebase é criado também no Google Cloud Console
https://console.cloud.google.com/

*/

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