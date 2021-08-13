import 'package:flutter/material.dart';
import 'my_button.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App3 - button"),
      ),
      body: _body(),
    );
  }

  // Layout: Column ou Row
  // SingleChildScrollView: adiciona scroll vertical.
  _body() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _button1(),
              MyButton("Botão 2.1", ()=>_onClickOk2("Um") ),
              MyButton("Botão 2.2", ()=>_onClickOk2("Dois"), fontSize: 50 ),
              MyButton("Botão 2.3", ()=>_onClickOk2("Três"), fontSize: 60, colorText: Colors.yellow,),
              MyButton("Botão 2.4", ()=>_onClickOk2("Quatro"), fontSize: 70, colorText: Colors.yellow, colorBG: Colors.blue),
              MyButton("Botão 2.5", ()=>_onClickOk2("Cinco") ),
              MyButton("Botão 2.6", ()=>_onClickOk2("Seis"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
              MyButton("Botão 2.7", ()=>_onClickOk2("Sete"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
              MyButton("Botão 2.8", ()=>_onClickOk2("Oito"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
              MyButton("Botão 2.9", ()=>_onClickOk2("Nove"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
            ]
        )
      ),
    );
  }

  // Atencao: RaisedButton deprecated
  // OBS: onPressed: apenas com o nome do método se nao houver params.
  // OBS: onPressed com funcao anonima, se houver parametros.
  // OBS: onPressed com null desabilita o botão.
  _button1() {
    return ElevatedButton(
        child: Text(
          "Botão 1",
        ),
        onPressed: _onClickOk1
    );
  }


  void _onClickOk1() {
    print("Clicou no botão1 Exclusivo! ");
  }

  void _onClickOk2(String str) {
    print("Clicou no botão compartilhado: " + str);
  }

}
