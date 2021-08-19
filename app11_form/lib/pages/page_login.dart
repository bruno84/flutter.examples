import 'package:app11_form/comp/comp_textformfield.dart';
import 'package:app11_form/comp/comp_elevatedbutton.dart';
import 'package:app11_form/pages/page_home.dart';
import 'package:app11_form/utils/prefs.dart';
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

    // ATENÇÃO: nunca use async diretamente em initState !!!
    _initForm();
  }

  _initForm() async //opção1
  {
    /*
     Future: classe cujo objeto é preenchido de forma assíncrona.
     OBS: "then" e "await" são usados em objetos Future, pois são situações
     em que a execução não é imediata e pode ter que "esperar".
     */

    // Opção1: await (na intrução) + async (no método)
    userEmail = await Prefs.getString("email");
    _contEmail.text = userEmail;

    // Opção2: objeto Future + then - async (no método)
    /*
    Future<String> futureUserEmail = Prefs.getString("email");
    futureUserEmail.then(
            (String str) {
          userEmail = str;              // atualizo atributo
          _contEmail.text = userEmail;  // atualizo campo
        }
    );
    */

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 11 - formulário e preferences"),
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
                inputListFormatter: [ FilteringTextInputFormatter.deny(RegExp('[#%*]')) ],
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

    Prefs.setString("email", email);

    await push( context, PageHome(email), flagBack: false);
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

  //----------------------------------------------------------------------------
  // UTILITÁRIOS
  //----------------------------------------------------------------------------
  // Empilhar uma nova página
  // OBS: adicionei um parametro para definir se pode voltar para página anterior.
  Future push(BuildContext context, Widget page, {bool flagBack=true})
  {
    if(flagBack)
    {
      // Pode voltar, ou seja, a página é adicionada na pilha.
      return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return page;
      }));
    }
    else
    {
      // Não pode voltar, ou seja, a página nova substitui a página atual.
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
        return page;
      }));
    }

  }


}
