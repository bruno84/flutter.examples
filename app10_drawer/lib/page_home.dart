import 'package:flutter/material.dart';
import 'my_drawer.dart';

/*
 drawer: perceba que o componente drawer é irmão de appBar e body.
 */
/*
 TabBar: pertence a AppBar, e requer um controlador (DefaultTabController).
 Dica: usei Alt+Enter para encapsular Scaffold com um DefaultTabController.
 TabBarView: permite definir um body para cada tab.
 */
class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("App10 - Drawer e TabBar"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tab1"),
              Tab(text: "Tab2"),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            _body1(),
            _body2(),
          ]
        ),
        drawer: MyDrawer(),
      ),
    );
  }

  _body1() {
    return Container(
      color: Colors.yellow,
      alignment: Alignment.topCenter,
      child: Text("Corpo 1"),
    );
  }

  _body2() {
    return Container(
      color: Colors.orange,
      alignment: Alignment.topCenter,
      child: Text("Corpo 2"),
    );
  }

}
