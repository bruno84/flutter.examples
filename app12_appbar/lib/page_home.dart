import 'package:flutter/material.dart';

import 'main.dart';
import 'utils/prefs.dart';

class PageHome extends StatefulWidget
{
  // atributo referente ao método que faz refresh em main
  late Function changeTheme;

  PageHome(this.changeTheme);

  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome>
{
  String texto = "Nenhuma opção!";

  // OBS: widget se refere à classe PageHome, de modo a acessar seus atributos.
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12 - Appbar"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              print("dark");
              Prefs.setBool("flagDark", true);
              // refresh: executo o método de callback
              widget.changeTheme(Brightness.dark);
            },
          ),

          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: () {
              print("light");
              setState(() {
                Prefs.setBool("flagDark", false);
                // refresh: executo o método de callback
                widget.changeTheme(Brightness.light);
              });
            },
          ),

          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopuoMenu(value),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "Opcao1", child: Text("Minha Opção1"),),
                PopupMenuItem(value: "Opcao2", child: Text("Minha Opção2"),),
                PopupMenuItem(value: "Opcao3", child: Text("Minha Opção3"),),
            ];
          }),
        ],
      ),

      body: _body(context),
    );
  }

  _body(BuildContext context)
  {
    return Center(
        child: Text(texto)
    );
  }

  void _onClickPopuoMenu(String value) {
    switch(value) {
      case "Opcao1": texto = "Cliquei na opção1"; break;
      case "Opcao2": texto = "Cliquei na opção2"; break;
      case "Opcao3": texto = "Cliquei na opção3"; break;
    }
    // refresh
    setState(() {});
  }

}
