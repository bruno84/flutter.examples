import 'package:app_11_03_api_crud/comp/comp_elevatedbutton.dart';
import 'package:app_11_03_api_crud/controllers/controller_home.dart';
import 'package:app_11_03_api_crud/model/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageHome extends StatelessWidget
{
  final ControllerHome controllerListHome = Get.find<ControllerHome>();
  late String str = "";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 11-03 - API CRUD"),
      ),

      body: _body(),
    );
  }

  _body()
  {
    return Container(
      padding: EdgeInsets.all(20),  // material design: 16
      child: ListView(
        children: [
          CompElevatedButton("Create Post", _onClickCreatePost, height: 30, fontSize: 16, colorBG: Colors.blue),
          SizedBox(height: 10),
          CompElevatedButton("Read Post",   _onClickReadPost, height: 30, fontSize: 16, colorBG: Colors.blue),
          SizedBox(height: 10),
          CompElevatedButton("Update Put Post", _onClickUpdatePutPost, height: 30, fontSize: 16, colorBG: Colors.blue),
          SizedBox(height: 10),
          CompElevatedButton("Delete Post", _onClickDeletePost, height: 30, fontSize: 16, colorBG: Colors.blue),
          SizedBox(height: 20),

          GetBuilder<ControllerHome>(builder: (context) {
            return Text( str );
          }),

        ],
      ),
    );
  }


  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  Future<void> _onClickCreatePost() async
  {
    print("_onClickCreatePost");
    str = "";
    Post post = Post(0, "titulo criado", "descricao criado", 100);
    str = await controllerListHome.createPost(post);
    print(str);
  }

  Future<void> _onClickReadPost() async
  {
    print("_onClickReadPost");
    str = "";
    List<Post> list = await controllerListHome.readPost();
    for(Post obj in list) {
      str = str + obj.toString() + "\n";
    }
    print(str);
  }

  Future<void> _onClickUpdatePutPost() async
  {
    print("_onClickUpdatePutPost");
    str = "";
    Post post = Post(0, "titulo alterado put", "descricao alterada put", 300);
    str = await controllerListHome.updatePutPost(2, post);
    print(str);
  }

  Future<void> _onClickDeletePost() async
  {
    print("_onClickDeletePost");
    str = "";
    str = await controllerListHome.deletePost(2);
    print(str);
  }

}
