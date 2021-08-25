
import 'package:app13_estados/model/conteudo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConteudoApi
{

  static Future<List<Conteudo>> getListConteudo() async
  {
    // OBS: força um delay. ùtil para testes.
    // Future.delayed(Duration(seconds: 3));

    var url = Uri.https("https://jsonplaceholder.typicode.com", "/todos/");

    print("GET > $url");

    // requisicao
    var response = await http.get(url);

    // obtem body do request
    String json = response.body;

    // obtem list do json
    List listJson = jsonDecode(json);

    List<Conteudo> listConteudo = [];

    // Converte lista de Json para lista do Objeto
    for(Map<String, dynamic> map in listJson) {
      Conteudo conteudo = Conteudo.fromJson(map);
      listConteudo.add(conteudo);
    }

    return listConteudo;
  }
}