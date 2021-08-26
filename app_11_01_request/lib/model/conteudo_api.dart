import 'dart:convert';
import 'package:http/http.dart' as http;
import 'conteudo.dart';

class ConteudoApi
{
  static Future<List<Conteudo>> getListConteudo() async
  {
    // OBS: força um delay. ùtil para testes.
    // Future.delayed(Duration(seconds: 3));

    var url = Uri.https("jsonplaceholder.typicode.com", "/todos/");

    print("GET: $url");

    // requisicao
    var response = await http.get(url);

    // obtem body do request
    String json = response.body;
    print("json: $json");

    // obtem list do json
    List listJson = jsonDecode(json);
    print("listJson: $listJson");

    List<Conteudo> listConteudo = [];

    // Converte lista de Json para lista do Objeto
    for(Map<String, dynamic> map in listJson) {
      Conteudo conteudo = Conteudo.fromJson(map);
      listConteudo.add(conteudo);
    }

    return listConteudo;
  }
}