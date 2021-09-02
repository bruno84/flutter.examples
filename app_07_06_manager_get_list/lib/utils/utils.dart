import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils
{
  // Função utilitária
  static Future push(BuildContext context, Widget page) {
    return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }
}

