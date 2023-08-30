import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'comp/comp_elevatedbutton.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  ImagePicker imagePicker = ImagePicker();
  var imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 13-01 - foto"),
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
          SizedBox(height: 20),
          CompElevatedButton("Camera - Imagem", _onClickCameraImagem, height: 30, fontSize: 20, colorBG: Colors.blue),
          SizedBox(height: 10),
          CompElevatedButton("Galeria - Imagem", _onClickGaleriaImagem, height: 30, fontSize: 20, colorBG: Colors.blue),
          SizedBox(height: 10),
          _image(),
          SizedBox(height: 20),
        ]
      )
    );
  }

  _image() {
    if (imageFile != null) {
      return Image.file(
        imageFile,
        height: 500,
        fit: BoxFit.fitHeight,
      );
    }
    else {
      return Image.network(
          "https://i0.wp.com/assecom.ufersa.edu.br/wp-content/uploads/sites/24/2018/01/assinatura_completa_cor_RGB-1-e1516038703426.png?resize=300%2C90&ssl=1",
      );
    }
  }


  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  void _onClickCameraImagem() async
  {
    XFile? xf = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50,   // 1-100
        preferredCameraDevice: CameraDevice.front
    );

    setState(() {
      this.imageFile = File(xf!.path);
    });
  }

  void _onClickGaleriaImagem() async
  {
    XFile? f = await imagePicker.pickImage(
        source: ImageSource.gallery
    );

    setState(() {
      this.imageFile = File(f!.path);
    });
  }

}