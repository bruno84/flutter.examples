import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/conteudo.dart';

class ConnectionApi
{
  static String _host = "jsonplaceholder.typicode.com";

  static Future<List<Conteudo>> getListConteudo() async
  {
    var url = Uri.https(_host, "/todos/");
    var response = await http.get(url);

    if(response.statusCode != 200) {
      return [];
    }

    String json = response.body;
    print(json);
    List listJson = jsonDecode(json);
    List<Conteudo> listObj = [];

    for(Map<String, dynamic> map in listJson) {
      Conteudo obj = Conteudo.fromJson(map);
      listObj.add(obj);
    }

    return listObj;
  }

}