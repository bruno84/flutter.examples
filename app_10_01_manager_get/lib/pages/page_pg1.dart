import 'package:app_10_01_manager_get/controllers/controller_main.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

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
