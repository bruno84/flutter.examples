import 'package:flutter/material.dart';

class DropDownString extends StatefulWidget
{
  late List<String> listItem = [];
  late dynamic callback;
  late String hint;
  late String? value;

  DropDownString(this.listItem, ValueChanged<String> this.callback, {this.hint="Lista de itens", this.value} );

  @override
  DropDownStringState createState() {
    return new DropDownStringState();
  }
}

class DropDownStringState extends State<DropDownString>
{
  var _selectedItem;

  @override
  Widget build(BuildContext context)
  {
    return DropdownButton<String>(
      hint: Text(widget.hint, style: TextStyle(fontSize: 40)),
      isExpanded: true,
      items: widget.listItem.map((String str) {
        return DropdownMenuItem<String>(
          value: str,
          child: Text(str, style: TextStyle(fontSize: 20) ),
        );
      }).toList(),
      onChanged: (newValue) {
        widget.callback(newValue);
        setState(() {
          _selectedItem = newValue!;
        });
      },
      value: _selectedItem,
    );
  }



  }
