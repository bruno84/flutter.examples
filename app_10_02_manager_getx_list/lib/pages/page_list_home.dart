import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../comp/alerts.dart';
import '../comp/comp_card_content.dart';
import '../controllers/controller_list_fav.dart';
import '../controllers/controller_list_home.dart';
import '../model/conteudo.dart';
import '../utils/utils.dart';
import 'page_list_fav.dart';

class PageListHome extends StatelessWidget
{
  // OBS: padrão de projeto Singleton
  final ControllerListHome controllerListHome = Get.find<ControllerListHome>();
  final ControllerListFav controllerListFav = Get.find<ControllerListFav>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 07-06 - get e list"),
        actions:
        [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              print("favoritos");
              Utils.push( context, PageListFav() );
            },
          ),
        ],
      ),

      body: _body(context),
    );
  }

  _body(BuildContext context)
  {
    List<Conteudo> listContHome = controllerListHome.listContHome;

    return GetBuilder<ControllerListHome>(builder: (context)
    {
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
        print(conteudo.nome);
        Alerts.showSnackBar(context, "Movido para Favoritos: ${conteudo.nome}");
        controllerListHome.removeHome(conteudo);
        controllerListFav.addFav(conteudo);
      },
      child: CompCardContent(conteudo)
    );
  }




}
