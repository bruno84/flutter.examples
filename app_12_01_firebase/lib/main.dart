import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pages/page_login.dart';
import 'firebase_options.dart';

/*
--------------------------------------------------------------------------------
CONFIGURAR FIREBASE (Flutter, para todas as plataformas)
--------------------------------------------------------------------------------
1) Entrar em Firebase Console: https://console.firebase.google.com/

2) Criar novo projeto.

3) "Adicione um app para começar" -> "Flutter"

4) "Instalar a CLI do Firebase e fazer login (execute firebase login)":
* Instalar: Node.JS e Firebase CLI para Windows (por meio do npm)
* Atenção: instale por meio do NodeJS e modo NPM. Se instalar pelo modo "binário autônomo" vai tar erro no próximo passo.
* Fazer login, conforme instruções que vão surgir: fazer login Google para obter código de acesso.
* Se der tudo certo, ao executar "firebase login" em firebase-tools-instant-win, vai aparecer: Already logged in as <seu email>

5) Configurar o CLI do FlutterFire (a pior parte):
* Abrir CMD apontando para seu projeto (ex: D:\WSS\WSS_Flutter_2024_1\app_12_01_firebase>):
* Executar: dart pub global activate flutterfire_cli
* Após isso, talvez seja preciso adicionar a pasta bin exibida no console no seu "path" (ex: C:\Users\bruno.monteiro\AppData\Local\Pub\Cache\bin)
* Executar no CMD, apontando para seu projeto: flutterfire configure --project=<ID do seu projeto Firebase>
* Habilite para as 4 plataformas.
* Informe seu applicationId (ex: br.edu.ufersa.app_12_01_firebase)
* Observação: seu applicationId pode ser encontrado em: android/app/build.gradle
* Atenção: meu prompt ficou quabrado neste momento, porém, para saber se deu certo o arquivo "firebase_options.dart" vai ser criado em lib.

--------------------------------------------------------------------------------
CONFIGURAR FIREBASE (continuação para Android)
--------------------------------------------------------------------------------
1) Abrir Firebase Console: https://console.firebase.google.com/
Visão geral do projeto -> "Configurações do projeto" -> APP: Android

2) Copiar arquivo google-services.json
Copie este arquivo na pasta: android/app/

3) Configurar Gradle:


OBSERVAÇÃO: Obter chave SHA1:
* Em CMD, acesse a pasta: C:\Program Files\Android\Android Studio\jbr\bin
* Em seguida execute o comando abaixo:
keytool -list -v -keystore "C:\Users\<user>\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
(ex: keytool -list -v -keystore "C:\Users\bruno.monteiro\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android)

DICA: Procure por "Bruno" neste exemplo para encontrar configurações específicas.

--------------------------------------------------------------------------------
CONFIGURAR SERVIÇOS FIREBASE
--------------------------------------------------------------------------------
https://console.firebase.google.com/

Serviço: Criação -> Authentication
Habilite os métodos de entrada desejados.
Ex: Google, email/senha

Serviço: Criação -> Firestore Databse
Crie um novo BD.
Na aba "Regras", use uma dessas regras:
a) Banco totalmente aberto:
allow read, write: if true;
b) Banco liberado apenas para usuários autenticados:
allow read, write: if request.auth != null;

Serviço: Criação -> Storage
Habilite o serviço.

*/

void main() async
{
  // Bruno: FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform );

  runApp( Main() );
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