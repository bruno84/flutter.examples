import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  // context: armazena as variaveis de contexto da aplicação.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app4 - column e row"),
      ),
      body: _body(context),
    );
  }

  // Column ou Row
  // mainAxis: refere-se ao eixo principal
  // * mainAxisSize por padrão é max
  // * mainAxisAlignment por padrão é start
  // crossAxis: refere-se ao eixo cruzado
  // * crossAxisAlignment só surte efeito se o elemento for aumentado
  _body(BuildContext context)
  {
    // Dimensoes da tela do dispositivo
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Colors.lightGreen,
      child: Column (
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text1(),
          _text1(),
          _linha(),
          _text2(),
          _text2(),
        ],
      ),
    );
  }

  _linha() {
    return
      Container(
          color: Colors.amberAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _text1(),
              _text2(),
            ],
          )
      );
  }

  _text1() {
    return Text(
        "Texto1",
        style: TextStyle(
          color: Colors.grey,
          backgroundColor: Colors.black,
          fontSize: 30,
        )
    );
  }

  _text2() {
    return Text(
        "Texto2",
        style: TextStyle(
          color: Colors.black,
          backgroundColor: Colors.grey,
          fontSize: 30,
        )
    );
  }
}
