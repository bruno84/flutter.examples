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

  Future<List<Conteudo>> _loadList() async
  {
    listConteudo = await ConteudoApi.getListConteudo();

    return listConteudo;
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

  _body(BuildContext context)
  {
    return Container(
        child: FutureBuilder(
            future: _loadList(),
            //initialData: "Carregando...",
            builder: (context, snapshot)
            {
              if (snapshot.hasData)
              {
                String text = snapshot.data.toString();

                return Center(
                  child: Text(text),
                );
              }
              else
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
        )
    );
  }










}
