import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class PageHome extends StatefulWidget
{
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 10-02 - form com INTL"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body()
  {
    // Obtem time_stamp atual:
    final DateTime dtNow = DateTime.now();

    // Formatos possíveis:
    // https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html
    final String str1 = DateFormat.yMMMMd().format(dtNow);
    final String str2 = DateFormat.yMd().format(dtNow);
    final String str3 = DateFormat.jms().format(dtNow);
    final String str4 = DateFormat("d MMM y").format(dtNow);

    // Obtem o idioma do sistema
    String languageCode = Localizations.localeOf(context).languageCode;
    print("languageCode = $languageCode");

    // formatter personalizado e conforme idioma
    final DateFormat formatter = DateFormat("d MMMM y", "pt_BR");

    final String strPt1 = formatter.format(dtNow);

    return ListView(
        children: [
          Text("str1: $str1"),
          Text("str2: $str2"),
          Text("str3: $str3"),
          Text("str4: $str4"),

          Text("strPers1: $strPt1"),

          ElevatedButton(
            child: Text("Selecione data"),
            onPressed: _showDatePicker,
          ),

          Text(
            _selectedDate == null
                ? 'Data vazia!'
                : 'Data: ${formatter.format(_selectedDate)}',
          ),
        ]

    );
  }

  //----------------------------------------------------------------------------
  // EVENTO
  //----------------------------------------------------------------------------

  _showDatePicker()
  {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}