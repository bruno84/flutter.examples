import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page_create.dart';
import 'controller/controller_contato.dart';
import 'page_perfil.dart';
import 'page_update.dart';


/*
GetBuilder x Obx x Getx

GetBuilder : para atualizar um widget manualmente, por meio do controller, com update().

Obx : para atualizar um widget por meio de uma variável observável marcada com .obs

Getx : combina os cenários do GetBuilder (manualmente) e Obx (observável).
 */


class PageHome extends StatelessWidget
{
  static const String nomeRota = "/";
  final controllerContact = Get.find<ControllerContato>();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/people2.jpg",
                height: 300,
                width: double.infinity,
              ),
              ElevatedButton.icon(onPressed: () {
                  Get.toNamed(PagePerfil.nomeRota);  // carrega página
                },
                icon: Icon(Icons.person),
                label: Text("Ver meu perfil"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.redAccent,
                  minimumSize: Size.fromHeight(52)
                ),
              ),
              SizedBox(height: 12),
              Text("Agenda Telefônica", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 8,),


              Obx( () =>
                  Center(
                      child: Text(
                        "Há ${controllerContact.contatos.length} contatos (Obx)",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[500]),
                      )
              )),

              GetBuilder(
                init: controllerContact,
                builder: (controller) {
                  return Center(
                      child: Text(
                        "Há ${controllerContact.contatos.length} contatos (GetBuilder)",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[500]),
                      )
                  );
                },
              ),

              GetX(
                init: controllerContact,
                builder: (controller) {
                  return Center(
                      child: Text(
                        "Há ${controllerContact.contatos.length} contatos (GetX)",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey[500]),
                      )
                  );
                },
              ),


              Obx( () => ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                physics:BouncingScrollPhysics(),
                itemCount: controllerContact.contatos.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(PageUpdate.nomeRota, arguments: index);
                    },
                    child: ListTile(
                      title: Text("${index + 1} - ${controllerContact.contatos[index].nome}"),
                      subtitle: Text(controllerContact.contatos[index].telefone),
                    ),
                  );
                },
                separatorBuilder:(context, int) {
                  return const Divider(thickness: 2);
                },
              )),
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("CRIAR CONTATO"),
        tooltip: "Dica",
        icon: const Icon(Icons.add),
        elevation: 0,
        onPressed: () {
          Get.to(PageCreate());
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
