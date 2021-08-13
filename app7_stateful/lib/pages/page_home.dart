import 'package:app7_stateful/model/conteudo.dart';
import 'package:app7_stateful/pages/page_show.dart';
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
        title: Text("App7 - Stateful e action"),
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
    late Widget widget;

    // CUIDADO: esse return interno pertence ao itemBuilder
    if(_flagList)
    {
      widget = ListView.builder(
          itemExtent: 300,
          itemCount: listConteudo.length,
          itemBuilder: (context, index) {
            return _itemView(listConteudo, index);
          }
      );
    }
    else
    {
      widget = GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          itemCount: listConteudo.length,
          itemBuilder: (context, index) {
            return _itemView(listConteudo, index);
          }
      );
    }

    return widget;
  }

  /*
  Dica 1: coloquei o nome itemView() pois é o mesmo do Android, responsável
          por pegar um objeto da lista e montar o card.
  Dica 2: usar Alt+Enter para encapsular uma widget, ou seja, fazer com que
          este widget se torne filho de outro.
  Dica 3: reaproveite o arquivo main.dart e a função push().
   */
  /*
  GestureDetector: responsável por tratar o evento no card.
                   Observe que o card (Stack) é filho dele.
   */
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
