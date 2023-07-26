import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App8 - Alerts"),
      ),
      body: _body(),
    );
  }


  _body() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _button(1),
              _button(2),
              _button(3),
            ]
        )
      ),
    );
  }

  // Dica: pode-se criar um builder pra obter o contexto da tela, pra evitar passa-lo desde o Scaffold.
  // Dica: Alt+Enter para envolver ElevatedButton com um Builder.

  _button(int type) {
    return Builder(
      builder: (context) {
        return ElevatedButton(
            child: Text(
              "Botão $type",
            ),
            onPressed: () => _onClickOk(type, context)
        );
      }
    );
  }


  void _onClickOk(int type, BuildContext context) {
    print("Clicou no botão $type");
    switch(type) {
      case 1: _showSnackBar(context); break;
      case 2: _showDialog(context); break;
      case 3: _showToast(context); break;
    }
  }


  _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("showSnackBar"),
          duration: Duration(milliseconds: 2000),
          action: SnackBarAction(
            textColor: Colors.yellow,
            label: "Clique aqui!",
            onPressed: () { print("Cliquei no SnackBar!"); },
          )
        )
    );
  }

  // barrierDismissible: se true (default), clicando fora fecha o Dialog.
  // WillPopScope: evita fechar o Dialog com o botão de back do Android.
  // Atenção: FlatButton está deprecated !!!
  _showDialog(BuildContext context) {
    showDialog(context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é muito legal"),
            actions: [

              TextButton (
                child: Text("Cancelar"),
                onPressed: () {
                  print("Cancelar!!!");
                  Navigator.pop(context);   // Fechar Dialog
                },
              ),

              TextButton (
                child: Text("OK"),
                onPressed: () {
                  print("OK!!!");
                  Navigator.pop(context);   // Fechar Dialog
                },
              )

            ],
          ),
        );
      },
    );
  }

  // Toast
  // OBS: Muito comum no Android, ele não é nativo do Flutter
  // Plugins: https://pub.dev/
  // Plugin: https://pub.dev/packages/fluttertoast
  _showToast(BuildContext context) {
    print("_showToast!!!");
    Fluttertoast.showToast(
        msg: "Meu Toast de um plugin",
        toastLength: Toast.LENGTH_LONG,      // Tempo: Android
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,                // Tempo: iOS e Web
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
