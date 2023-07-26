import 'package:flutter/material.dart';


//  Dica: Alt+Enter : para mudar de StatelessWidget StatefulWidget.
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
        title: Text("APP 07-02 - Stateful, FAB"),
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

  // Row (horizontal) ou Column (vertical)
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

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  _onClickFabAdd() {
    print("Adicionar");
    setState(() {
      cont++;   // variável envolvida na mudança de estado
    });
  }

  _onClickFabReduce() {
    print("Remover");
    setState(() {
      cont--; // variável envolvida na mudança de estado
    });
  }
}
