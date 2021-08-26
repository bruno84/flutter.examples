import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 10-02 - form com INTL"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body()
  {
    // https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
    final DateTime dtNow = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss');

    //initializeDateFormatting('pt_BR');

    final String str1 = formatter.format(dtNow);
    final String str2 = DateFormat.yMMMMd().format(dtNow);
    final String str3 = DateFormat.yMd().format(dtNow);
    final String str4 = DateFormat.jms().format(dtNow);
    final String str5 = DateFormat('d MMM y').format(dtNow);




    return ListView(
        children: [
          Text("str1: $str1"),
          Text("str2: $str2"),
          Text("str3: $str3"),
          Text("str4: $str4"),
          Text("str5: $str5"),
        ]

    );
  }


}