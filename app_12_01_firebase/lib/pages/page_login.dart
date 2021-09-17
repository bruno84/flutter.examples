import 'package:app_12_01_firebase/comp/comp_elevatedbutton.dart';
import 'package:app_12_01_firebase/comp/comp_textformfield.dart';
import 'package:app_12_01_firebase/firebase/firebase_service.dart';
import 'package:app_12_01_firebase/firebase/response.dart';
import 'package:app_12_01_firebase/pages/page_home.dart';
import 'package:app_12_01_firebase/utils/utils.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// OBS: com StatefulWidget, já consigo obter o context como atributo da classe.
class PageLogin extends StatefulWidget {
  @override
  _PageLogin createState() => _PageLogin();
}

class _PageLogin extends State<PageLogin>
{
  static String userEmail = "";

  // key: identificador de cada componente
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // OBS: útil em testes, se quiser já autopreencher, usar o arg text
  TextEditingController _contEmail = TextEditingController();
  TextEditingController _contPass = TextEditingController();

  // OBS: em um form com vários campos, precisaria ter um para cada (exceto o primeiro)
  FocusNode _focusPass = FocusNode();

  // initState: Configura a tela na inicialização com dados que podem estar sendo obtidos em tempo de execução.
  @override
  void initState()
  {
    super.initState();
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12-01 - firebase login"),
      ),
      body: _body(),
    );
  }

  // ListView: componentes filhos na vertical com scroll.
  // TextFormField: campo de entrada (componentizei).
  // SizedBox: componente vazio apenas para distanciar componentes vizinhos.
  // Form: foi criado apenas para encapsular os campos que quero validar.
  // ElevatedButton: botão para submeter formulário (componentizei)
  _body()
  {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),  // material design: 16
        child: ListView(
          children: [

            SizedBox(height: 20),

            Container(
              child: GoogleAuthButton(
                onPressed: _onClickGoogleLogin,
              ),
            )

          ],
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------
  // EVENTO
  //----------------------------------------------------------------------------

  _onClickGoogleLogin() async
  {
    print("_onClickGoogleLogin");

    final fbService = FirebaseService();
    Response response = await fbService.loginGoogle();

    if (response.ok) {
      push(context, PageHome(), flagBack: true);
    } else {
      print("Erro: " + response.msg);
    }
  }


}
