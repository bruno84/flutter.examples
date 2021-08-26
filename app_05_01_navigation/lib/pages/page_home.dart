import 'package:flutter/material.dart';
import 'page_01.dart';
import 'page_02.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 05-01 - navegação entre telas"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column (
            children: [
              _button("Page 01", 1, context),
              _button("Page 02", 2, context),
            ]
        ),
    );
  }

  _button(String str, int page, BuildContext context) {
    return ElevatedButton(
        child: Text(str),
        onPressed: () =>_onClickPageX(str, page, context),
    );
  }

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  // ATENÇÃO: push() retorna um Future que é um recurso assíncrono, por isso,
  // é preciso usar "async" e "await" para obter o resultado.
  void _onClickPageX(String str, int page, BuildContext context) async
  {
    print("Clicou no botão: " + str);

    late Widget wPage = Page01();
    switch(page) {
      case 1: wPage = Page01(); break;
      case 2: wPage = Page02(); break;
    }

    String retorno = "";
    try {
      // Empilha wPage sobre PageHome:
      retorno = await push(context, wPage);

      // Empilha wPage, e desempilha PageHome:
      //retorno = await push(context, wPage, flagBack: false);
    }
    catch(error) {
      retorno = "setinha da appbar";
    }

    print("retorno: $retorno");
  }

  //----------------------------------------------------------------------------
  // UTILS
  //----------------------------------------------------------------------------
  // push = empilha tela
  // pop = desempilha tela

  // OBS: adicionei um parametro para definir se pode voltar para página anterior.
  Future push(BuildContext context, Widget page, {bool flagBack=true})
  {
    if (flagBack)
    {
      // Pode voltar, ou seja, a página é adicionada na pilha.
      return Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) { return page; })
      );
    }
    else
    {
      // Não pode voltar, ou seja, a página nova substitui a página atual.
      return Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (BuildContext context) { return page; })
      );
    }
  }

}
