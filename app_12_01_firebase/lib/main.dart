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
1) Firebase Console:
https://console.firebase.google.com/
Adicionar projeto.
"Adicione um app para começar"
E preencha os campos abaixo:

1.1) Campo: applicationId (pacote da app):
Para encontrar No arquivo: android/app/build.gradle
Ex: org.brunomonteiro.app_12_01_firebase

1.2) Campo: SHA1
Para conseguir o SHA1, execute o comando no terminal:
keytool -list -v -keystore C:\Users\{User}\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
Exemplo:
keytool -list -v -keystore C:\Users\bruno.monteiro\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android

2) Copiar arquivo google-services.json
Copie este arquivo na pasta: android/app/

3) Firebase: E-mail para Suporte
FireBase Console -> Project Settings
Preencha Support email.

4) Habilitar Google SignIn:
FireBase Console -> Authentication -> aba: SignIn Method -> Habilitar: Google

5) Projeto Firebase é criado também no Google Cloud Console
https://console.cloud.google.com/
Cloud Console -> APIs e Serviços -> OAuth Consent Screen -> Editar Aplicativo
copiar e colar URL padrão nos campos: "homepage" e "Privacy Policy"

*/

/*
CONFIGURAR Cloud Firestore

https://console.firebase.google.com/

1) Em Firestore Databse, crie uma nova coleção.

2) Na aba "Regras", use uma dessas regras:
a) Banco totalmente aberto:
allow read, write: if true;
b) Banco liberado apenas para usuários autenticados:
allow read, write: if request.auth != null;

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