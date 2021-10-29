import 'dart:io';
import 'package:app_12_01_firebase/comp/comp_elevatedbutton.dart';
import 'package:app_12_01_firebase/firebase/facade_firebase_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PageFBStorage extends StatefulWidget
{
  @override
  _PageFBStorageState createState() => _PageFBStorageState();
}

class _PageFBStorageState extends State<PageFBStorage>
{
  // Firebase Storage
  FirebaseStorage fbStorage = FirebaseStorage.instance;

  ImagePicker imagePicker = ImagePicker();
  var _imageFile;
  late String _status = "";
  late String _url = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12-01 - Storage"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body()
  {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [

            CompElevatedButton("Camera", _onClickCameraImagem, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Galeria", _onClickGaleriaImagem, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),

            _image1(),
            SizedBox(height: 10),

            CompElevatedButton("Fazer upload", _onClickUpload, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),

            _image2(),
            SizedBox(height: 10),

            SelectableText( _status ),
            SizedBox(height: 10),
            SelectableText( _url ),
          ],
        )
    );
  }

  _image1()
  {
    if (_imageFile != null) {
      return Image.file(
        _imageFile,
        height: 400,
        fit: BoxFit.fitHeight,
      );
    }
    else {
      return Image.network(
        "https://i0.wp.com/assecom.ufersa.edu.br/wp-content/uploads/sites/24/2018/01/assinatura_completa_cor_RGB-1-e1516038703426.png?resize=300%2C90&ssl=1",
      );
    }
  }

  _image2()
  {
    if (_url == "") {
      return Container();
    }
    else {
      return Image.network(_url);
    }
  }


  Future uploadImagem() async
  {
    Reference pastaRaiz = fbStorage.ref();
    Reference arquivo = pastaRaiz.child("fotos").child("foto1.jpg");

    // Faz upload
    UploadTask task = arquivo.putFile(_imageFile);

    // Verifica progresso
    task.snapshotEvents.listen((TaskSnapshot taskSnapshot)
    {
      if( taskSnapshot.state == TaskState.running ){
        setState(() {
          _status = "Carregando...";
        });
      }
      else if( taskSnapshot.state == TaskState.success ){
        obterUrl( taskSnapshot );
        setState(() {
          _status = "Upload OK!";
        });
      }
      else if( taskSnapshot.state == TaskState.error ){
        setState(() {
          _status = "Falha =/";
        });
      }
    });
  }


  // OBS: Perceba que o objetivo principal é obter a URL da imagem que sofreu upload.
  //      Quem faz o download é o componente Image.
  Future obterUrl(TaskSnapshot taskSnapshot) async
  {
    String url = await taskSnapshot.ref.getDownloadURL();
    print("url: " + url );

    setState(() {
      _url = url;
    });

  }



  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  void _onClickCameraImagem() async
  {
    XFile? xf = await imagePicker.pickImage(
        source: ImageSource.camera,
    );

    setState(() {
      this._imageFile = File(xf!.path);
    });
  }

  void _onClickGaleriaImagem() async
  {
    XFile? f = await imagePicker.pickImage(
        source: ImageSource.gallery
    );

    setState(() {
      this._imageFile = File(f!.path);
    });
  }

  void _onClickUpload() async
  {
    if(_imageFile == null) {
      setState(() {
        _status = "Imagem não selecionada!";
      });
    }
    else {
      uploadImagem();
    }

  }

}