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

CONFIGURAR FIREBASE:
0) Firebase Console:
https://console.firebase.google.com/
Adicionar projeto.
"Adicione um app para começar"

1) applicationId (pacote da app):
No arquivo: android/app/build.gradle
Ex: org.brunomonteiro.app_12_01_firebase

2) Como conseguir o SHA1:
Comando no terminal:
keytool -list -v -keystore C:\Users\{User}\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
Exemplo:
keytool -list -v -keystore C:\Users\bruno.monteiro\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android

3) Copiar arquivo google-services.json
Local: android/app/

4) Firebase: E-mail para Suporte
FireBase Console -> Project Settings
Preencha Support email.

5) Habilitar Google SignIn:
FireBase Console -> Authentication -> aba: SignIn Method -> Habilitar: Google

6) Projeto Firebase é criado também no Google Cloud Console
https://console.cloud.google.com/
Cloud Console -> APIs e Serviços -> OAuth Consent Screen -> Editar Aplicativo
copiar e colar URL padrão nos campos: "homepage" e "Privacy Policy"

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