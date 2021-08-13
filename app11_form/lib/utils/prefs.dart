import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Prefs
{
  // clear
  static Future<void> clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  // BOOL
  static Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static void setBool(String key, bool b) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, b);
  }

  // INT
  static Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static void setInt(String key, int i) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, i);
  }

  // DOUBLE
  static Future<double> getDouble(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0;
  }

  static void setDouble(String key, double d) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, d);
  }

  // String
  static Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static void setString(String key, String s) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, s);
  }

}