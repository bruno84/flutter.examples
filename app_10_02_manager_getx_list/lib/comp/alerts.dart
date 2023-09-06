import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alerts
{
  static showSnackBar(BuildContext context, String str) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(str),
            duration: Duration(milliseconds: 2000),
        )
    );
  }
}