import 'package:flutter/material.dart';

// Objetivo: Componentização de um botão.
class CompElevatedButton extends StatelessWidget
{
  // Atributos:
  String text;
  double fontSize;
  Color colorText;
  Color colorBG;
  double height;
  Function() onPressed;

  /*
    Construtor:
    argum. obrigatório: na chamada, não preciso informar nome do argumento
    argum. opcional:
           * ficam entre chaves { ... }
           * na chamada, preciso informar o nome do argumento
  */
  CompElevatedButton(
      this.text,
      this.onPressed,
      {
        this.fontSize=14,
        this.colorText=Colors.white,
        this.colorBG=Colors.black,
        this.height=30
      }
  );


  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: height,
      child: ElevatedButton(
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontSize: fontSize,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: colorBG,
          ),
          onPressed: onPressed
      ),
    );
  }
}


