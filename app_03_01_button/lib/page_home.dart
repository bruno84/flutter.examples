import 'package:flutter/material.dart';
import 'comp/comp_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 03-01 - Button"),
      ),
      body: _body(),
    );
  }

  // SingleChildScrollView: aceita apenas um filho e adiciona scroll vertical.
  // Column ou Row: importantes componentes de layout. Aceitam muitos filhos.
  _body()
  {
    return SingleChildScrollView(
      child: Center(
        child: Column(
            children: [
              _button1(),
              CompButton("Botão 2.1", _onClickOk1 ),
              CompButton("Botão 2.2", ()=>_onClickOk2("Dois"), fontSize: 22 ),
              CompButton("Botão 2.3", ()=>_onClickOk2("Três"), fontSize: 23, colorText: Colors.yellow,),
              CompButton("Botão 2.4", ()=>_onClickOk2("Quatro"), fontSize: 24, colorText: Colors.yellow, colorBG: Colors.blue),
              CompButton("Botão 2.5", ()=>_onClickOk2("Cinco") ),
              CompButton("Botão 2.6", ()=>_onClickOk2("Seis"), fontSize: 26, colorText: Colors.yellow, colorBG: Colors.blue),
              CompButton("Botão 2.7", ()=>_onClickOk2("Sete"), fontSize: 27, colorText: Colors.yellow, colorBG: Colors.blue),
              CompButton("Botão 2.8", null, fontSize: 28, colorBG: Colors.blue),
              CompButton("Botão 2.9", ()=>_onClickOk2("Nove"), fontSize: 29, colorText: Colors.yellow, colorBG: Colors.blue),
            ]
        )
      ),
    );
  }

  // ElevatedButton
  // OBS: onPressed: usar  apenas com o nome do método, se nao houver params.
  // OBS: onPressed: usar  funcao anonima, se houver parametros.
  // OBS: onPressed: com null desabilita o botão.
  _button1() {
    return ElevatedButton(
        onPressed: _onClickOk1,
        child: const Text("Botão 1")
    );
  }

//------------------------------------------------------------------------------
// EVENTOS
//------------------------------------------------------------------------------
  void _onClickOk1() {
    print("Evento: _onClickOk1");
  }

  void _onClickOk2(String str) {
    print("Evento: _onClickOk2: $str");
    _showToast("Toast: $str");
  }

  // Toast
  // OBS: Muito comum no Android, ele não é nativo do Flutter
  // Plugin: https://pub.dev/packages/fluttertoast
  _showToast(String str)
  {
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,      // Tempo: Android
        timeInSecForIosWeb: 3,                // Tempo: iOS e Web
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}