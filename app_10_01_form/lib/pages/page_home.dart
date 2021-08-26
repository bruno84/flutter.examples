import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  String _email;

  PageHome(this._email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 11 - Home"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
        color: Colors.white,
        child: Center(
            child: Text("Uma linda tela de Home!!! \n $_email")
        )
    );
  }

}