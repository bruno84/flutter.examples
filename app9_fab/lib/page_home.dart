import 'package:flutter/material.dart';

/*
  Dica: inicialmente a classe era StatelessWidget.
  Para mudar para StatefulWidget, usei Alt+Enter
 */
class PageHome extends StatefulWidget
{
  @override
  _PageHomeState createState() => _PageHomeState();
}

// OBS: perceba que o componente floatingActionButton é irmão de appBar e body.
class _PageHomeState extends State<PageHome>
{
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App9 - FloatingActionButton"),
      ),
      body: _body(),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _body() {
      return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Text("Contator: $cont")
      );
  }

  _floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [

        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _onClickFabAdd()
        ),

        SizedBox(
          height: 20,
          width: 20,
        ),

        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: () => _onClickFabReduce()
        )

      ],
    );
  }

  _onClickFabAdd() {
    print("Adicionar");
    setState(() {
      cont++;
    });
  }

  _onClickFabReduce() {
    print("Remover");
    setState(() {
      cont--;
    });
  }
}
