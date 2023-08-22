import 'package:app_12_01_firebase/comp/comp_elevatedbutton.dart';
import 'package:app_12_01_firebase/comp/comp_textformfield.dart';
import 'package:app_12_01_firebase/firebase/facade_firebase_firestore.dart';
import 'package:app_12_01_firebase/firebase/facade_firebase_service.dart';
import 'package:app_12_01_firebase/firebase/response.dart';
import 'package:app_12_01_firebase/model/post.dart';
import 'package:app_12_01_firebase/pages/page_login.dart';
import 'package:app_12_01_firebase/utils/utils.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageFBFirestore extends StatefulWidget
{
  @override
  _PageFBFirestoreState createState() => _PageFBFirestoreState();
}

class _PageFBFirestoreState extends State<PageFBFirestore>
{
  // Banco de Dados
  final fbFirestore = FacadeFirebaseFirestore();

  late String str = "";
  TextEditingController _contID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12-01 - Firestore"),
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
            CompTextFormField("ID", "Digite o ID", _contID, inputType: TextInputType.text),

            CompElevatedButton("Firestore Create", _onClickCreate, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Firestore Read",   _onClickRead, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Firestore Update", _onClickUpdate, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Firestore Delete", _onClickDelete, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 20),

            SelectableText( str ),
          ],
        )
    );
  }

  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  Future<void> _onClickCreate() async
  {
    print("_onClickCreate");
    str = "";

    Post post = Post("", "titulo criado", "descricao criado", "100");
    str = await fbFirestore.createPost(post);
    print(str);

    setState(() { });
  }

  Future<void> _onClickRead() async
  {
    print("_onClickRead");
    str = "";

    List<Post> list = await fbFirestore.readPost();
    for(Post obj in list) {
      str = str + obj.toString() + "\n";
    }

    print(str);

    setState(() { });
  }

  Future<void> _onClickUpdate() async
  {
    print("_onClickUpdate");
    str = "";

    String id = _contID.text;
    Post post = Post("", "titulo alterado", "descricao alterado", "200");
    str = await fbFirestore.updatePost(id, post);
    print(str);

    setState(() { });
  }

  Future<void> _onClickDelete() async
  {
    print("_onClickDelete");
    str = "";

    String id = _contID.text;
    str = await fbFirestore.deletePost(id);
    print(str);

    setState(() { });
  }


}