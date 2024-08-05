import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class ControllerPrefs
{
  // clear
  static Future<void> clear() async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.clear();
  }

  // BOOL
  static Future<bool> getBool(String key) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    return await prefs.getBool(key) ?? false;
  }

  static void setBool(String key, bool b) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setBool(key, b);
  }

  // INT
  static Future<int> getInt(String key) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    return await prefs.getInt(key) ?? 0;
  }

  static void setInt(String key, int i) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setInt(key, i);
  }

  // DOUBLE
  static Future<double> getDouble(String key) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    return await prefs.getDouble(key) ?? 0;
  }

  static void setDouble(String key, double d) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setDouble(key, d);
  }

  // String
  static Future<String> getString(String key) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    return await prefs.getString(key) ?? "";
  }

  static void setString(String key, String s) async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString(key, s);
  }

}