import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';

class ConnectionApi
{
  static String _host = "jsonplaceholder.typicode.com";
  static Map<String,String> _header = {"Content-type": "application/json; charset=UTF-8"};

  // CREATE
  static Future<String> create(Post post) async
  {
    var uri = Uri.https(_host, "/posts");
    var corpo = json.encode( post.toJson() );
    http.Response response = await http.post( uri, headers: _header, body: corpo );
    return "CREATE code: ${response.statusCode} body: ${response.body}";
  }

  // READ
  static Future<List<Post>> read() async
  {
    List<Post> listObj = [];
    var uri = Uri.https(_host, "/posts");
    var response = await http.get(uri);

    if(response.statusCode != 200) {
      return [];
    }

    String json = response.body;
    List listJson = jsonDecode(json);

    for(Map<String, dynamic> map in listJson) {
      Post obj = Post.fromJson(map);
      listObj.add(obj);
    }

    return listObj;
  }

  // UPDATE (com put)
  // OBS: atualiza objeto inteiro, e pode cria objeto novo, caso não haja constraints.
  static Future<String> updatePut(int id, Post post) async
  {
    var uri = Uri.https(_host, "/posts/$id");
    var corpo = json.encode( post.toJson() );
    http.Response response = await http.put( uri, headers: _header, body: corpo );
    return "UPDATE PUT code: ${response.statusCode} body: ${response.body}";
  }

  // DELETE
  static Future<String> delete(int id) async
  {
    var uri = Uri.https(_host, "/posts/$id");
    http.Response response = await http.delete( uri );
    return "DELETE code: ${response.statusCode} body: ${response.body}";
  }

}