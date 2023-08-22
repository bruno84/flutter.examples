import 'package:app_12_01_firebase/comp/comp_elevatedbutton.dart';
import 'package:app_12_01_firebase/firebase/facade_firebase_service.dart';
import 'package:app_12_01_firebase/firebase/response.dart';
import 'package:app_12_01_firebase/pages/page_firestore.dart';
import 'package:app_12_01_firebase/pages/page_storage.dart';
import 'package:app_12_01_firebase/pages/page_login.dart';
import 'package:app_12_01_firebase/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageHome extends StatefulWidget
{
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  // Autenticacao
  final fbService = FacadeFirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12-01 - Home"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body()
  {
    String userStr = "";

    fbService.getUser().then((value) {
      User fbUser = value;
      userStr = fbUser.toString();
      print("user: " + userStr);
    });

    return Container(
        color: Colors.white,
        child: ListView(
          children: [

            FutureBuilder(
                future: fbService.getUser(),
                builder: (context, snapshot)
                {
                    return Center(
                      child: SelectableText("user: " + userStr),
                    );
                }
            ),
            SizedBox(height: 10),

            CompElevatedButton("Logout", _onClickGoogleLogout, height: 30, fontSize: 16, colorBG: Colors.red),
            SizedBox(height: 10),

            CompElevatedButton("Page Firestore", _onClickPageFirestore, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),

            CompElevatedButton("Page Storage", _onClickPageStorage, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
          ],
        )
    );
  }


  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  _onClickGoogleLogout() async
  {
    print("_onClickGoogleLogout");

    Response response = await fbService.logout();

    if (response.ok) {
      push(context, PageLogin(), flagBack: false);
    } else {
      print("Erro: " + response.msg);
    }
  }

  _onClickPageFirestore() async
  {
    print("_onClickPageFirestore");
    await push(context, PageFBFirestore(), flagBack: true);
  }

  _onClickPageStorage() async
  {
    print("_onClickPageStorage");
    await push(context, new PageFBStorage(), flagBack: true);
  }

}