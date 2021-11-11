import 'package:flutter/material.dart';

import 'comp/dropdown_string.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  Color color = Colors.black;
  String corStr = "Azul";

  final listItem = ["Azul", "Amarelo", "Verde", "Vermelho", "Preto" ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 11_4 - Dropdown"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body()
  {
    return Container(
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              DropDownString(listItem, _onCorChanged, hint: "Lista de Cores" ),
              SizedBox(height: 50),
              Text("Cor selecionada: $corStr", style: TextStyle(color: color, fontSize: 20) )
            ],
          ),
        )
    );
  }

  void _onCorChanged(String value)
  {
    print("> $value");

    setState(() {
      corStr = value;
      if ("Azul" == value) {
        color = Colors.blue;
      } else if ("Amarelo" == value) {
        color = Colors.yellow;
      } else if ("Verde" == value) {
        color = Colors.green;
      }else if ("Vermelho" == value) {
        color = Colors.red;
      }else if ("Preto" == value) {
        color = Colors.black;
      }
    });
  }

}