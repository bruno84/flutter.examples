import 'package:flutter/material.dart';
import 'page_01.dart';
import 'page_02.dart';
import 'page_03.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App6 - Expanded, ListView e GridView"),
      ),
      body: _body(context),
    );
  }

  // Layout: Column ou Row
  // SingleChildScrollView: adiciona scroll vertical.
  _body(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column (
            children: [
              _button("Expanded", 1, context),
              _button("ListView", 2, context),
              _button("GridView", 3, context),
            ]
        ),
    );
  }

  _button(String str, int page, BuildContext context) {
    return ElevatedButton(
        child: Text(str),
        onPressed: () {
          _onClickPageX(str, page, context);
        }
    );
  }

  // Atenção:
  /*
    push() retorna um Future que é um recurso assíncrono, por isso,
    é preciso usar async e await para obter o resultado.
   */
  void _onClickPageX(String str, int page, BuildContext context) async
  {
    print("Clicou no botão: " + str);

    late Widget wPage = Page01();
    switch(page) {
      case 1: wPage = Page01(); break;
      case 2: wPage = Page02(); break;
      case 3: wPage = Page03(); break;
    }

    await push(context, wPage);
  }

  // Função utilitária
  Future push(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

}
