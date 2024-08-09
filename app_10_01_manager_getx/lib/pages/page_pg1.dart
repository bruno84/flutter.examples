import 'package:flutter/material.dart';

class PagePg1 extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('PagePg1'),
      ),

      body: ListView(children:
        [
          Text("Pagina1"),
        ],
      ),


    );
  }
}
