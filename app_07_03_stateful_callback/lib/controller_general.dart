import 'package:flutter/material.dart';
import 'controller_prefs.dart';

class ControllerGeneral
{
  static bool flagDark = false;
  static String opcao = "nenhuma opção ainda";

  static Future<Brightness> getBrightness() async
  {
    flagDark = await ControllerPrefs.getBool("flagDark");
    return flagDark ? Brightness.dark : Brightness.light;
  }

  static Future<String> getOpcao() async
  {
    opcao = await ControllerPrefs.getString("opcao");
    return opcao;
  }

}