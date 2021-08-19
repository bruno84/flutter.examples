import 'package:flutter/material.dart';

import 'prefs.dart';

class CompTheme
{
  static bool flagDark = false;

  static Brightness getBrightness()
  {
    Future<bool> futureFlagDark = Prefs.getBool("flagDark");
    futureFlagDark.then(
            (bool value) {
              flagDark = value;
            }
    );

    return flagDark ? Brightness.dark : Brightness.light;
  }

}