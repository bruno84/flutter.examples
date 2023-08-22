//----------------------------------------------------------------------------
// UTILS
//----------------------------------------------------------------------------
// push = empilha tela
// pop = desempilha tela

// OBS: adicionei um parametro para definir se pode voltar para página anterior.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool flagBack=true})
{
  if (flagBack)
  {
    // Pode voltar, ou seja, a página é adicionada na pilha.
    return Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) { return page; })
    );
  }
  else
  {
    // Não pode voltar, ou seja, a página nova substitui a página atual.
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) { return page; })
    );
  }
}