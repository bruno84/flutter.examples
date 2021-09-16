import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12 - Home"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
        color: Colors.white,
        child: Center(
            child: Text("Uma linda tela de Home!!!")
        )
    );
  }

}