import 'package:flutter/material.dart';
// Atencao: lembre-se de importar esta lib.

// Dica: identação = filho; mesmo nível = irmão.
// Dica: segurar ctrl+clicar no componente, para ver os param obrig e opcionais.

// Widgets são hierarquizados.
// Alguns permitem apenas um filho (child) e outros permitem vários filhos (children)

// StatelessWidget : Widget em que nao há alteração de estado.
class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // Scaffold: estrutura de layout básica, que ocupa toda a tela.
    // Parametros mais comuns: appBar e body
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 01 - alô mundo!"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  // OBS: _ representa private.
  Container _body()
  {
    // Container: widget de painel muito usado (black, por padrão).
    return Container(
        color: Colors.blueGrey,
        child: Center(
	    // Center: widget usado apenas para centralizar um filho    
            child: _text()
        )
    );
  }

  // OBS: é opcional explicitar o retorno.
  // OBS: se um objeto não vai ser alterado, use const para melhorar desempenho.
  Text _text()
  {
    // Text: componente de texto.
    // style: principal param de personalização.
    return const Text("alô mundo!!!",
      style: TextStyle(
        color: Colors.orange,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        // OBS: é opcional colocar a vírgula do último parametro.
      ),
    );
  }
}