import 'dart:async';

import 'package:app13_estados/model/conteudo.dart';
import 'package:app13_estados/model/conteudo_api.dart';
import 'package:app13_estados/pages/page_show.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget
{
  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome>
{
  List<Conteudo> listConteudo = [];
  StreamController streamController = StreamController();

  @override
  void initState()
  {
    super.initState();

    _loadList();
  }

  _loadList() async
  {
    List<Conteudo> list = await ConteudoApi.getListConteudo();
    listConteudo = list;
    print(listConteudo);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("App13 - Gerência de Estados"), // Base: Exemplo 7
      ),

      body: _body(context),
    );
  }

  // ATENCAO: não colocar regras de negócio em build, pois ele é chamado várias vezes!
  _body(BuildContext context)
  {
    return StreamBuilder(
        stream: streamController.stream,
        builder: (BuildContext context, snapshot) {
          return _listView(listConteudo);
        },
    );
  }

  Container _listView(List<Conteudo> listConteudo)
  {
    return Container(
      child: ListView.builder(
        itemExtent: 300,
        itemCount: listConteudo.length,
        itemBuilder: (context, index) {
          return _itemView(listConteudo, index);
        }
      )
    );
  }

  _itemView(List<dynamic> listConteudo, int index)
  {
    Conteudo conteudo = listConteudo[index];

    return GestureDetector(
      onTap: () {
        print(conteudo.title);
        push( context, PageShow(conteudo) );
      },
      child: Stack(
          fit: StackFit.expand,
          children:
          [
            Text( conteudo.toString() )
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
