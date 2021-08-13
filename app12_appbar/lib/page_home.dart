import 'package:flutter/material.dart';

class PageHome extends StatefulWidget
{
  @override
  _PageHome createState() => _PageHome();
}

// setState: método que deve ser chamado para redesenhar a tela.
class _PageHome extends State<PageHome>
{
  bool _flagList = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("App12 - Appbar"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              print("dark");
              setState( () {
                _flagList = true;
              });
            },
          ),

          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: () {
              print("light");
              setState(() {
                _flagList = false;
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
        child: Text("Nada de mais")
    );
  }

  void _onClickPopuoMenu(String value) {
    switch(value) {
      case "Opcao1": print("Cliquei na opção1"); break;
      case "Opcao2": print("Cliquei na opção2"); break;
      case "Opcao3": print("Cliquei na opção3"); break;
    }
  }

}
