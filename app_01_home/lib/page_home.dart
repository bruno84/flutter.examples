import 'package:flutter/material.dart';
// Atencao: lembre-se de importar esta lib.

// Scaffold: estrutura de layout básica, que ocupa toda a tela.
// Parametros mais comuns: appBar e body

// Container: componente de painel (black, por padrão).
// child: filho do componente.

// Dica: identação = filho; mesmo nível = irmão.
// Dica: segurar ctrl+clicar no componente, para ver os param obrig e opcionais.
class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 01 - alô mundo!"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
        color: Colors.blueGrey,
        child: Center(
            child: _text()
        )
    );
  }

  // OBS: _ representa private.
  // OBS: é opcional explicitar o retorno.
  // OBS: é opcional colocar a vírgula do último elemento.

  // Text: componente de texto.
  // style: principal param de personalização.
  Text _text() {
    return Text("alô mundo!!!",
      style: TextStyle(
        color: Colors.orange,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
      ),
    );
  }
}