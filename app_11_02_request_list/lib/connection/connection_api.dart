import 'dart:convert';
import 'package:app_11_02_request_list/model/response_generic.dart';
import 'package:http/http.dart' as http;
import '../model/conteudo.dart';

class ConnectionApi
{
  static String _host = "reqres.in";

  static Future<List<Conteudo>> getListConteudo() async
  {
    List<Conteudo> listObj = [];

    var url = Uri.https(_host, '/api/unknown?page=2');  // OBS: Parametrize o numero da pagina
    var response = await http.get(url);

    if(response.statusCode != 200) {
      return [];
    }

    // Trata dados da paginacao
    String jsonBody = response.body;
    print(jsonBody);

    ResponseGeneric responseGeneric = ResponseGeneric.fromJson( json.decode( jsonBody ) );
    print(responseGeneric);

    // Trata a lista de objetos
    List<dynamic> jsonData = responseGeneric.data;
    print(jsonData);

    for(Map<String, dynamic> map in jsonData) {
      Conteudo obj = Conteudo.fromJson(map);
      listObj.add(obj);
    }

    return listObj;
  }

}