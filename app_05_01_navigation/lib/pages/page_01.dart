import 'package:flutter/material.dart';

class Page01 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("page 01"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
        color: Colors.white,
        child: _button(context),
    );
  }

  _button(BuildContext context) {
    return ElevatedButton(
        child: Text("Botão voltar"),
        onPressed: () {
          _onClickBack(context);
        }
    );
  }

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  void _onClickBack(BuildContext context) {
    print("Clicou no botão voltar! ");
    Navigator.pop(context, "pagina1");
  }

}
