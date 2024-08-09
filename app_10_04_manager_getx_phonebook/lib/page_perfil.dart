import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/controller_perfil.dart';

class PagePerfil extends StatelessWidget
{
  static const String nomeRota = "/perfil";

  final controllerProfile = Get.find<ControllerPerfil>();

  final _formKey = GlobalKey<FormState>();

  final  TextEditingController textEditingControllerNome = TextEditingController();
  final  TextEditingController textEditingControllerIdade = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx( () {
              return Column(
                children: [
                  Image.network(controllerProfile.perfil.foto),
                  SizedBox(height: 12,),
                  Text(controllerProfile.perfil.nome, style: Theme.of(context).textTheme.titleLarge),
                  Text("${controllerProfile.perfil.idade} anos", style: Theme.of(context).textTheme.titleMedium),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textEditingControllerNome,
                            decoration: const InputDecoration(hintText: "Nome", labelText: "Nome")
                          ),
                          TextFormField(
                            controller: textEditingControllerIdade,
                            decoration: const InputDecoration(hintText: "Idade", labelText: "Idade"),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(height: 12,),
                          ElevatedButton.icon(
                            onPressed: () {
                              controllerProfile.editar(
                                nome: textEditingControllerNome.text,
                                idade: int.parse(textEditingControllerIdade.text),
                              );
                              Get.snackbar("Atualizado com sucesso", "Legal!",
                                colorText: Colors.white,
                                backgroundColor: Colors.lightBlue,
                                icon: const Icon(Icons.add_alert),
                              );
                            },
                            icon: const Icon(Icons.change_circle),
                            label: const Text("EDITAR PERFIL"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ]
        ),
      ),
    );
  }

}