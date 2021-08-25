import 'package:app_07_01_stateful_list_grid/model/conteudo.dart';
import 'package:flutter/material.dart';

import 'page_show.dart';

// StatefulWidget : componente cujo estado pode ser alterado.
class PageHome extends StatefulWidget
{
  @override
  _PageHome createState() => _PageHome();
}

// IMPORTANTE: setState: método que deve ser chamado para redesenhar a tela.
class _PageHome extends State<PageHome>
{
  bool _flagList = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 07-01 - Stateful, action, list e grid"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              print("list");
              setState( () {
                _flagList = true;
              });
            },
          ),

          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              print("grid");
              setState(() {
                _flagList = false;
              });
            },
          )
        ],
      ),

      body: _body(context),
    );
  }

  _body(BuildContext context)
  {
    List<Conteudo> listConteudo = [
      Conteudo("Conteudo1", "assets/images/image1.jpg"),
      Conteudo("Conteudo2", "assets/images/image2.jpg"),
      Conteudo("Conteudo3", "assets/images/image3.jpg"),
      Conteudo("Conteudo1", "assets/images/image1.jpg"),
      Conteudo("Conteudo2", "assets/images/image2.jpg"),
      Conteudo("Conteudo3", "assets/images/image3.jpg"),
    ];

    // Widget que será retornado pelo body
    late Widget widgetBody;

    // CUIDADO: esse return interno pertence ao itemBuilder
    if(_flagList)
    {
      widgetBody = ListView.builder(
          itemExtent: 300,
          itemCount: listConteudo.length,
          itemBuilder: (context, index) {
            return _itemView(listConteudo, index);
          }
      );
    }
    else
    {
      widgetBody = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemCount: listConteudo.length,
          itemBuilder: (context, index) {
            return _itemView(listConteudo, index);
          }
      );
    }

    return widgetBody;
  }

  // OBS: itemView() pega um objeto da lista para montar o card.
  // Dica: Alt+Enter para encapsular ou remover uma widget
  // Dica: reaproveite o arquivo main.dart e a função push().

  // GestureDetector: trata evento do card (Stack), que é filho dele.
  _itemView(List<dynamic> listConteudo, int index)
  {
    Conteudo conteudo = listConteudo[index];

    return GestureDetector(
      onTap: () {
        print(conteudo.nome);
        push( context, PageShow(conteudo) );
      },
      child: Stack(
          fit: StackFit.expand,
          children:
          [
            _imgAsset(conteudo.foto),

            Container(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                      conteudo.nome,
                      style: TextStyle(
                          fontSize: 20, color: Colors.white
                      )
                  ),
                )
            )
          ]
      ),
    );
  }


  _imgAsset(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }


  // Função utilitária
  Future push(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

}
