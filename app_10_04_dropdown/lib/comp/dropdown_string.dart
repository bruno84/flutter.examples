import 'package:flutter/material.dart';

class DropDownString extends StatefulWidget
{
  late List<String> listItem = [];
  late dynamic callback;
  late String hint;
  late String? valueDefault;

  DropDownString(this.listItem, ValueChanged<String> this.callback, {this.hint="Lista de itens", this.valueDefault} );

  @override
  DropDownStringState createState() {
    return new DropDownStringState();
  }
}

class DropDownStringState extends State<DropDownString>
{
  @override
  Widget build(BuildContext context)
  {
    return DropdownButton<String>(
      value: widget.valueDefault,
      isExpanded: true,
      items: widget.listItem.map((String str) {
        return new DropdownMenuItem<String>(
          value: str,
          child: new Text(str, style: TextStyle(fontSize: 20) ),
        );
      }).toList(),
      hint: Text(widget.hint),
      onChanged: (newValue) {
        widget.callback(newValue);
      },
    );
  }
}
