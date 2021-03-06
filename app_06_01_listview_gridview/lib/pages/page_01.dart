import 'package:app_06_01_listview_gridview/model/conteudo.dart';
import 'package:flutter/material.dart';

class Page01 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: _body(),
    );
  }

  _body()
  {
    List<Conteudo> listConteudo = [
      Conteudo("Conteudo1", "assets/images/image1.jpg"),
      Conteudo("Conteudo2", "assets/images/image2.jpg"),
      Conteudo("Conteudo3", "assets/images/image3.jpg"),
    ];

    // ListView.builder = monta cada item da lista (é o "adapter" do Android)
    // itemExtent: padroniza a altura dos cards do ListView
    // OBS: como saber os parametros do itemBuilder? ver IndexedWidgetBuilder
    // ATENÇÃO! itemCount é obrigatório!

    // Stack: empilha elementos. Cuidado com a ordem!
    // decoration: argumento para estilizar o Container
    ListView lvBuilder = ListView.builder(
      itemExtent: 300,
      itemCount: listConteudo.length,
      itemBuilder: (context, index)
      {
        Conteudo conteudo = listConteudo[index];

        Stack stack = Stack(
          fit: StackFit.expand,
          children: [

            _imgAsset(conteudo.foto),

            Container(
                alignment: Alignment.bottomLeft,
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
        );

        return stack;
      }
    );

    return lvBuilder;
  }

  _imgAsset(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }



}
