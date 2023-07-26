import 'package:flutter/material.dart';
import 'page_01.dart';
import 'page_02.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 06-01 - ListView e GridView"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column (
            children: [
              _button("ListView", 1, context),
              _button("GridView", 2, context),
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


  void _onClickPageX(String str, int page, BuildContext context) async
  {
    print("Clicou no botão: " + str);

    late Widget wPage = Page01();
    switch(page) {
      case 1: wPage = Page01(); break;
      case 2: wPage = Page02(); break;
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
