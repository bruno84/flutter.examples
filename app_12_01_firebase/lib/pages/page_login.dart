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
        title: Text("APP 12-01 - formulário e preferences"),
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
            CompTextFormField("Email", "Digite seu email", _contEmail,
                inputType: TextInputType.emailAddress,
                inputValidator: _validateEmail,
                inputActionNext: _focusPass,
                inputListFormatter: [ FilteringTextInputFormatter.deny(RegExp('[#%*]')) ],  // pode adicionar outras regras, inclusive com "allow".
            ),
            SizedBox(height: 20),

            CompTextFormField("Senha", "Digite sua senha", _contPass,
                inputType: TextInputType.number,
                inputObscure: true,
                inputValidator: _validatePass,
                inputFocusNode: _focusPass,
                inputAction: TextInputAction.send,
                inputActionSubmit: _onClickLogin,
                inputMaxLength: 20,
            ),
            SizedBox(height: 20),

            CompElevatedButton("Login", _onClickLogin, height: 50, fontSize: 22, colorBG: Colors.blue),
            SizedBox(height: 20),

            Container(
              child: GoogleAuthButton(
                onPressed: _onClickGoogle,
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
  // OBS: validate() chama os métodos que especifiquei em "validator" em cada TextFormField.
  Future<void> _onClickLogin() async
  {
    print("_onClickLogin");

    // true: sem erros
    bool flag = _formKey.currentState!.validate();
    if( !flag ) {
      print("Problema de validação");
      return;
    }

    String email = _contEmail.text;
    String pass = _contPass.text;
    print("Email: $email, Pass: $pass");

    await push( context, PageHome(), flagBack: false);
  }

  _onClickGoogle() async
  {
    print("_onClickGoogle");

    final service = FirebaseService();
    Response response = await service.loginGoogle();

    if (response.ok) {
      push(context, PageHome(), flagBack: true);
    } else {
      print("Erro: " + response.msg);
    }
  }

  //----------------------------------------------------------------------------
  // VALIDATE
  //----------------------------------------------------------------------------
  // OBS: argumento deve ser dynamic !!!
  String? _validateEmail(dynamic text) {
    if (text.isEmpty) {
      return "Campo vazio!";
    }
    return null;
  }

  // OBS: argumento deve ser dynamic !!!
  String? _validatePass(dynamic text) {
    if (text.isEmpty) {
      return "Campo vazio!";
    }
    if (text.length < 4) {
      return "No mínimo: 4 números";
    }
    return null;
  }

}
