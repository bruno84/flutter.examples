import 'package:flutter/material.dart';

class Page02 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App5 - page 02"),
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

  void _onClickBack(BuildContext context) {
    print("Clicou no botão voltar! ");
    Navigator.pop(context, "pagina2");
  }

}
