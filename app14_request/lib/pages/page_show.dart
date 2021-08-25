import 'package:app13_estados/model/conteudo.dart';
import 'package:flutter/material.dart';

class PageShow extends StatelessWidget
{
  late Conteudo conteudo;

  PageShow(this.conteudo);

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(conteudo.title),
      ),

      body: Text( conteudo.toString() ),
    );
  }
}
