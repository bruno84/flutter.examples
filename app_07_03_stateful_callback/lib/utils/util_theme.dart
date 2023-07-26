import 'package:flutter/material.dart';

import 'util_prefs.dart';

class UtilTheme
{
  static bool flagDark = false;

  static Brightness getBrightness()
  {
    Future<bool> futureFlagDark = UtilPrefs.getBool("flagDark");
    futureFlagDark.then(
            (bool value) {
              flagDark = value;
            }
    );

    return flagDark ? Brightness.dark : Brightness.light;
  }

}