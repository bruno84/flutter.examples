import 'package:app_16_02_anim/comp/comp_elevatedbutton.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  bool _status = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 16_2 - Animation"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body() {
    return Container(
        color: Colors.white,
      child: ListView(
        children: [
          CompElevatedButton("Mudar", onClickMudar),
          _anim1(),
        ],
      ),
    );
  }

  // COMPONENTES DE ANIMAÇÃO IMPLÍCITA.
  // OBS: Precisas apenas subtituir o componente "desanimado" por sua versão "animada" =)
  // https://api.flutter.dev/flutter/widgets/ImplicitlyAnimatedWidget-class.html

  // CURVAS:
  // OBS: curvas definem como a animação vai ser realizada.
  // https://api.flutter.dev/flutter/animation/Curves-class.html
  _anim1()
  {
    return AnimatedContainer(
      padding: EdgeInsets.all(20),
      width: _status ? 200 : 300 ,
      height: _status ? 300 : 200,
      color: _status ? Colors.blue : Colors.green,
      child: Image.network("https://i0.wp.com/assecom.ufersa.edu.br/wp-content/uploads/sites/24/2018/01/assinatura_completa_cor_RGB-1-e1516038703426.png?resize=300%2C90&ssl=1"),
      duration: Duration(seconds: 1),
      curve: Curves.elasticInOut,
    );
  }


  onClickMudar()
  {
    setState(() {
      _status = !_status;
    });
  }


}