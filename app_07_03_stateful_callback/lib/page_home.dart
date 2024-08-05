import 'package:flutter/material.dart';
import 'controller_general.dart';
import 'controller_prefs.dart';

class PageHome extends StatefulWidget
{
  // Atributo que armazena o método de callback criado em main
  late Function mudarTema;

  // Construtor que recebe método de callback que veio de main
  PageHome(this.mudarTema);

  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome>
{
  String texto = "";

  getOpcao() async {
    texto = await ControllerGeneral.getOpcao();
  }

  @override
  initState()
  {
    // WidgetsBinding: "The glue between the widgets layer and the Flutter engine".
    // addPostFrameCallback(): é executado apenas uma vez após a criação da tela.
    WidgetsBinding.instance.addPostFrameCallback( (_) async
    {
      // atualiza o atributo da tela
      await getOpcao();
      // força refresh da tela
      setState( () { } );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 07-03 - callback, appbar, SharedPreferences"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () => onClickMudarTema(true),
          ),

          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: () => onClickMudarTema(false),
          ),

          PopupMenuButton<String>(
            onSelected: (String value) => _onClickPopupMenu(value),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "opcao1", child: Text("Minha opcao1"),),
                PopupMenuItem(value: "opcao2", child: Text("Minha opcao2"),),
                PopupMenuItem(value: "opcao3", child: Text("Minha opcao3"),),
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

  void onClickMudarTema(bool flagDark)
  {
    // Altera preferencia
    ControllerPrefs.setBool("flagDark", flagDark);

    // refresh: mudo o estado da widget "Main" por meio do método de callback
    // OBS: widget = referência à classe PageHome, de modo a acessar seus atributos.
    flagDark ? widget.mudarTema(Brightness.dark) : widget.mudarTema(Brightness.light);
  }

  void _onClickPopupMenu(String opcao)
  {
    // Altera preferencia
    ControllerPrefs.setString("opcao", opcao);

    // refresh: mudo o estado desta widget "PageHome"
    setState(() {
      switch(opcao) {
        case "opcao1": texto = opcao; break;
        case "opcao2": texto = opcao; break;
        case "opcao3": texto = opcao; break;
      }
    });
  }

}
