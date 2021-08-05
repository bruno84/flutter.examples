import 'package:flutter/material.dart';
// Atencao: lembre-se de importar esta lib.

// Scaffold: estrutura de layout básica, que ocupa toda a tela.
// Scaffold: Parametros mais utilizados: appBar e body
// Container: componente de painel (black, por padrão).
// child: filho do componente.
// OBS: É opcional colocar a vírgula do último elemento.
// Dica: identação = filho; mesmo nível = irmão.
// Dica: segurar ctrl+clicar no componente, para ver os param obrig e opcionais.
class PageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App1 - basicão"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
        color: Colors.white,
        child: Center(
            child: _text()
        )
    );
  }

  // OBS: _ representa private.
  // OBS: é opcional explicitar o retorno.
  // style : principal param de personalizacao.
  Text _text() {
    return Text("alooo mundão!!!",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
      ),
    );
  }
}