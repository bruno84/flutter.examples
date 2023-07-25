import 'package:flutter/material.dart';
import 'utils/util_prefs.dart';

class PageHome extends StatefulWidget
{
  // Atributo referente ao método de callback
  late Function changeTheme;

  // Construtor que recebe método de callback
  PageHome(this.changeTheme);

  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome>
{
  String texto = "Nenhuma opção!";


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 07-03 - callback, appbar"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () => onClickChangeTheme(true),
          ),

          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: () => onClickChangeTheme(false),
          ),

          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopupMenu(value),
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

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------

  void onClickChangeTheme(bool flagDark)
  {
    print("flagDark = $flagDark");
    UtilPrefs.setBool("flagDark", flagDark);
    // refresh: mudo o estado da widget "Main" por meio do método de callback
    // OBS: widget = referência à classe PageHome, de modo a acessar seus atributos.
    flagDark ? widget.changeTheme(Brightness.dark) : widget.changeTheme(Brightness.light);
  }

  void _onClickPopupMenu(String value)
  {
    // refresh: mudo o estado desta widget "PageHome"
    setState(() {
      switch(value) {
        case "Opcao1": texto = "Cliquei na opção1"; break;
        case "Opcao2": texto = "Cliquei na opção2"; break;
        case "Opcao3": texto = "Cliquei na opção3"; break;
      }
    });
  }

}
