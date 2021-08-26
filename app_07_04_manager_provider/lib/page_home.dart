import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 10-04 - Ger.Est. Provider"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body()
  {



    return ListView(
        children: [
          Text("str1:"),
        ]

    );
  }


}