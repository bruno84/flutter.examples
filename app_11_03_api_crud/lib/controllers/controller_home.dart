import 'package:app_11_03_api_crud/connection/connection_api.dart';
import 'package:app_11_03_api_crud/model/post.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerHome extends GetxController
{
  // Atributos:
  List<Post> _listPost = [];

  // Getters:
  List<Post> get listPost => _listPost;

  @override
  void onInit() async    // chamado quando o widget é alocado na memória
  {
    print("ControllerHome: onInit()");
    super.onInit();

    _listPost = await ConnectionApi.read();
    update();
  }

  // CREATE   Sucesso: 201 Created
  Future<String> createPost(Post post) async {
    String str = await ConnectionApi.create(post);
    update();
    return str;
  }

  // READ   Sucesso: 200 OK
  Future<List<Post>> readPost() async {
    _listPost = await ConnectionApi.read();
    update();
    return _listPost;
  }

  // UPDATE PUT   Sucesso: 200 OK
  Future<String> updatePutPost(int id, Post post) async {
    String str = await ConnectionApi.updatePut(id, post);
    update();
    return str;
  }

  // DELETE
  Future<String> deletePost(int id) async {
    String str = await ConnectionApi.delete(id);
    update();
    return str;
  }

  @override
  void onReady() { // chamado quando o widget é renderizado na tela
    print("ControllerHome: onReady()");
    super.onReady();
  }

  @override
  void onClose() { // chamado quando o controlador é removido da memória
    print("ControllerHome: onClose()");
    super.onClose();
  }

}
