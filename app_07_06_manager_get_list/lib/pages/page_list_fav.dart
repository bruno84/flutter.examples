import 'package:app_07_06_manager_get_list/comp/alerts.dart';
import 'package:app_07_06_manager_get_list/comp/comp_card_content.dart';
import 'package:app_07_06_manager_get_list/controllers/controller_list_fav.dart';
import 'package:app_07_06_manager_get_list/controllers/controller_list_home.dart';
import 'package:app_07_06_manager_get_list/model/conteudo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageListFav extends StatefulWidget
{
  @override
  _PageListFav createState() => _PageListFav();
}

class _PageListFav extends State<PageListFav>
{
  final ControllerListHome controllerListHome = Get.find<ControllerListHome>();
  final ControllerListFav controllerListFav = Get.find<ControllerListFav>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),

      body: _body(context),
    );
  }

  _body(BuildContext context)
  {
    List<Conteudo> listContFav = controllerListFav.listContFav;

    return GetBuilder<ControllerListFav>(builder: (context)
    {
      return ListView.builder(
          itemExtent: 300,
          itemCount: listContFav.length,
          itemBuilder: (context, index) {
            return _itemView(listContFav, index);
          }
      );
    });
  }

  // itemView() pega um objeto da lista para montar o card.
  _itemView(List<dynamic> listConteudo, int index)
  {
    Conteudo conteudo = listConteudo[index];

    // GestureDetector: trata evento do card (Stack), que é filho dele.
    return GestureDetector(
      onTap: () {
        print(conteudo.nome);
        Alerts.showSnackBar(context, "Movido para Home: ${conteudo.nome}");
        controllerListFav.removeFav(conteudo);
        controllerListHome.addHome(conteudo);
      },
      child: CompCardContent(conteudo)
    );
  }




}
