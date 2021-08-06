import 'package:app7_stateful/model/conteudo.dart';
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
        title: Text(conteudo.nome),
      ),

      body: Image.asset(conteudo.foto),
    );
  }
}
