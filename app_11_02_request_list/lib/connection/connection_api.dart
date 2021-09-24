import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/conteudo.dart';

class ConnectionApi
{
  static String _host = "jsonplaceholder.typicode.com";

  static Future<List<Conteudo>> getListConteudo() async
  {
    List<Conteudo> listObj = [];

    var url = Uri.https(_host, "/todos/");
    var response = await http.get(url);

    if(response.statusCode != 200) {
      return [];
    }

    String json = response.body;
    List listJson = jsonDecode(json);

    for(Map<String, dynamic> map in listJson) {
      Conteudo obj = Conteudo.fromJson(map);
      listObj.add(obj);
    }

    return listObj;
  }

}