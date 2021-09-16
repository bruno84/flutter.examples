import 'package:app_11_02_request_list/comp/alerts.dart';
import 'package:app_11_02_request_list/comp/comp_card_content.dart';
import 'package:app_11_02_request_list/controllers/controller_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/conteudo.dart';

class PageHome extends StatelessWidget
{
  final ControllerHome controllerListHome = Get.find<ControllerHome>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 11-02 - Request e List"),
      ),

      body: _body(context),
    );
  }


  _body(BuildContext context)
  {
    return GetBuilder<ControllerHome>(builder: (context)
    {
      List<Conteudo> listContHome = controllerListHome.listContHome;

      return ListView.builder(
          itemExtent: 300,
          itemCount: listContHome.length,
          itemBuilder: (context, index) {
            return _itemView(listContHome, index, context);
          }
      );
    });
  }


  // itemView() pega um objeto da lista para montar o card.
  _itemView(List<dynamic> listConteudo, int index, context)
  {
    Conteudo conteudo = listConteudo[index];

    // GestureDetector: trata evento do card (Stack), que é filho dele.
    return GestureDetector(
        onTap: () {
          print(conteudo.title);
          Alerts.showSnackBar(context, "Movido para Favoritos: ${conteudo.title}");
        },
        child: CompCardContent(conteudo)
    );
  }

}
