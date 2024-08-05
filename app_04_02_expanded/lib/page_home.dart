import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APP 04-02 - Expanded") ),
      body: _body(context),
    );
  }

  // Expanded: componente que expande uma célula (Column/Row) proporcionalmente.
  _body(context)
  {
    return Column(
      children: [

        Expanded(
          flex: 6,  //60%
          child: Container(
            color: Colors.orange
          ),
        ),

        Expanded(
          flex: 4,  //40%
          child: Row(
              children: [
                Expanded(
                  flex: 2,  //20%
                  child: Container(
                    color: Colors.blue
                  ),
                ),
                Expanded(
                  flex: 8,  //80%
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
