import 'package:flutter/material.dart';

class Page01 extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App6 - Expanded"),
      ),
      body: _body(context),
    );
  }

  /*
  Expanded: componente que expande uma célula (Column/Row) proporcionalmente.
   */
  _body(context) {
    return Column(
      children: [

        Expanded(
          flex: 6,
          child: Container(
            color: Colors.orange
          ),
        ),

        Expanded(
          flex: 4,
          child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    color: Colors.red
                  ),
                ),
              ],
          ),
        )

      ],
    );
  }




}
