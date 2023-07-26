import 'package:flutter/material.dart';
import 'comp/comp_drawer.dart';

// OBS: drawer é irmão de appBar e body.

// TabBar: pertence a AppBar, e requer um controlador (DefaultTabController).
// TabBarView: permite definir um body para cada tab.
// Dica: Alt+Enter para encapsular Scaffold com um DefaultTabController.
class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("APP 07-05 - Drawer e TabBar"),
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
        drawer: CompDrawer(),
      ),
    );
  }

  _body1() {
    return Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: Text("Corpo 1"),
    );
  }

  _body2() {
    return Container(
      color: Colors.orange,
      alignment: Alignment.center,
      child: Text("Corpo 2"),
    );
  }

}
