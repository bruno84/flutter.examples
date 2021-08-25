import 'package:flutter/material.dart';
import 'comp/comp_button.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 03-01 - Button"),
      ),
      body: _body(),
    );
  }

  // SingleChildScrollView: aceita apenas um filho e adiciona scroll vertical.
  // Column ou Row: importantes componentes de layout. Aceitam muitos filhos.
  _body() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
            children: [
              _button1(),
              CompButton("Botão 2.1", ()=>_onClickOk2("Um") ),
              CompButton("Botão 2.2", ()=>_onClickOk2("Dois"), fontSize: 50 ),
              CompButton("Botão 2.3", ()=>_onClickOk2("Três"), fontSize: 60, colorText: Colors.yellow,),
              CompButton("Botão 2.4", ()=>_onClickOk2("Quatro"), fontSize: 70, colorText: Colors.yellow, colorBG: Colors.blue),
              CompButton("Botão 2.5", ()=>_onClickOk2("Cinco") ),
              CompButton("Botão 2.6", ()=>_onClickOk2("Seis"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
              CompButton("Botão 2.7", ()=>_onClickOk2("Sete"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
              CompButton("Botão 2.8", null, fontSize: 80, colorBG: Colors.blue),
              CompButton("Botão 2.9", ()=>_onClickOk2("Nove"), fontSize: 80, colorText: Colors.yellow, colorBG: Colors.blue),
            ]
        )
      ),
    );
  }

  // ATENÇÃO! RaisedButton está deprecated
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

//------------------------------------------------------------------------------
// EVENTOS
//------------------------------------------------------------------------------
  void _onClickOk1() {
    print("Clicou no botão1 Exclusivo! ");
  }

  void _onClickOk2(String str) {
    print("Clicou no botão compartilhado: " + str);
  }

}
