import 'package:flutter/material.dart';

// Objetivo: Componentização de um botão.
class MyButton extends StatelessWidget
{
  late String text;
  late double fontSize;
  late Color colorText;
  late Color colorBG;
  late Function() onPressed;

  /* OBS: argum obrigatório: na chamada, não preciso informar nome do argumento
          argum opcional: na chamada, preciso informar o nome do argumento */
  // OBS: R
  MyButton(this.text, this.onPressed, {this.fontSize=14, this.colorText=Colors.white, this.colorBG=Colors.black} );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}


