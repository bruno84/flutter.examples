import 'package:flutter/material.dart';
import 'canvas_paint.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  late Widget componente = Container();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 16_1 - Canvas"),
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
          componente = _canvasPaint()
        ],
      ),
    );
  }

  _canvasPaint() {
    return Center(
          child: Container(
            color: Colors.green,
            width: 300,
            height: 400,
            child: CustomPaint(
              painter: CanvasPaint(),
            ),
          ),
        );
  }


}