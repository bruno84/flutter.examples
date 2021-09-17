import 'package:app_12_01_firebase/comp/comp_elevatedbutton.dart';
import 'package:app_12_01_firebase/firebase/firebase_service.dart';
import 'package:app_12_01_firebase/firebase/response.dart';
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
  final fbService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 12 - Home"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  Container _body()
  {
    print("body");
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
            Center(
                child: Text("Uma linda tela de Home!!!")
            ),
            SizedBox(height: 20),

            FutureBuilder(
                future: fbService.getUser(),
                builder: (context, snapshot)
                {
                    return Center(
                      child: Text("user: " + userStr),
                    );
                }
            ),

            SizedBox(height: 20),
            CompElevatedButton("Logout", _onClickGoogleLogout, height: 50, fontSize: 22, colorBG: Colors.blue),
          ],
        )
    );
  }

  _onClickGoogleLogout() async
  {
    print("_onClickGoogleLogout");

    final fbService = FirebaseService();
    Response response = await fbService.logout();

    if (response.ok) {
      push(context, PageLogin(), flagBack: false);
    } else {
      print("Erro: " + response.msg);
    }
  }
}