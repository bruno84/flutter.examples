import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  // context: armazena as variaveis de contexto da aplicação.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 04-01 - column e row"),
      ),
      body: _body(context),
    );
  }

  // Column (vertical) ou Row (horizontal)
  // mainAxis: refere-se ao eixo PRINCIPAL
  // * mainAxisSize por padrão é max
  // * mainAxisAlignment por padrão é start
  // crossAxis: refere-se ao eixo CRUZADO
  // * crossAxisAlignment só surte efeito se o elemento for aumentado
  _body(BuildContext context)
  {
    // Dimensoes da tela do dispositivo
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width-100,
      color: Colors.lightGreen,
      child: Column (
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _text1(),
          _text1(),
          _linha(),
          _text1(),
          _text1(),
        ],
      ),
    );
  }

  // OBS: MainAxisAlignment.spaceEvenly :
  // distribui os componentes proporcionalmente no espaço disponível.
  _linha() {
    return
      Container(
          color: Colors.amberAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _text2(),
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
