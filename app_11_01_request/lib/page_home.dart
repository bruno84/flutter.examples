import 'dart:async';
import 'package:flutter/material.dart';
import 'model/conteudo.dart';
import 'model/conteudo_api.dart';

class PageHome extends StatefulWidget
{
  @override
  _PageHome createState() => _PageHome();
}

class _PageHome extends State<PageHome>
{
  List<Conteudo> listConteudo = [];

  @override
  void initState()
  {
    super.initState();

    _loadList();
  }

  _loadList() async
  {
    print("_loadList");
    List<Conteudo> list = await ConteudoApi.getListConteudo();

    listConteudo = list;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 11-01 - Request"),
      ),

      body: _body(context),
    );
  }

  // ATENCAO: não colocar regras de negócio em build, pois ele é chamado várias vezes!
  _body(BuildContext context)
  {
    print("_body");
    String text = listConteudo.toString();

    print("text: $text");
    return SingleChildScrollView(
      child: Text(text),
    );
  }










}
