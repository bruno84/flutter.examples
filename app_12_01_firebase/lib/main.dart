import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/page_login.dart';
import 'firebase_options.dart';

void main() async
{
  // Bruno: FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform );

  runApp( Main() );
}

/*
CONFIGURAR FIREBASE (Flutter, para todas as plataformas):
1) Firebase Console:
https://console.firebase.google.com/

1.1) Criar novo projeto.
"Adicione um app para começar -> Flutter"

1.2) Instale FlutterFire CLI (por meio do NodeJS)
Habilite para as 4 plataformas.

1.3) Faça login e siga o wizard para gerar o arquivo firebase_options.dart em lib.

OBS: o projeto Firebase é criado também no Google Cloud Console
https://console.cloud.google.com/


CONFIGURAR FIREBASE (continuação para Android):
1) Firebase Console:
https://console.firebase.google.com/
Visão geral do projeto -> APP: Android

1.1) Campo: pacote da app:
Pode-se encontrar em: android/app/build.gradle
Ex: org.brunomonteiro.app_12_01_firebase

1.2) Campo: SHA1
Para conseguir o SHA1, execute o comando no terminal:
keytool -list -v -keystore C:\Users\{User}\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android
Exemplo:
keytool -list -v -keystore C:\Users\bruno.monteiro\.android\debug.keystore -alias androiddebugkey -storepass android -keypass android

1.3) Copiar arquivo google-services.json
Copie este arquivo na pasta: android/app/

1.4) Firebase: E-mail para Suporte
FireBase Console -> Project Settings
Preencha Support email.

1.5) Habilitar Google SignIn:
FireBase Console -> Authentication -> aba: SignIn Method -> Habilitar: Google

1.6) Projeto Firebase é criado também no Google Cloud Console
https://console.cloud.google.com/
Tela de permissão OAuth -> Externa -> preencher formulário

ATENÇÃO:
Procure por "Bruno" neste exemplo para encontrar configurações específicas.

*/


/*
CONFIGURAR SERVIÇOS FIREBASE:
https://console.firebase.google.com/

Serviço: Authentication
1) Habilite os métodos de entrada desejados.
Ex: Google, email/senha

Serviço: Firestore Databse
1) Crie um novo BD.

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