import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/contato.dart';
import 'controller/controller_contato.dart';

class PageUpdate extends StatelessWidget
{
  static const String nomeRota = '/update';

  final controllerContact = Get.find<ControllerContato>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingControllerName = TextEditingController();
  final TextEditingController textEditingControllerPhone = TextEditingController();

  final Contato _contact = Contato('', '', false);

  @override
  Widget build(BuildContext context)
  {
    int index = Get.arguments;
    Contato contact = controllerContact.contatos[index];
    textEditingControllerName.text = contact.nome;
    textEditingControllerPhone.text = contact.telefone;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Text("Atualizar contato", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEditingControllerName,
                      decoration: InputDecoration(
                          hintText: "Nome do contato", labelText: "Nome"),
                           onSaved: (newValue) {
                            _contact.nome = newValue ?? '';
                          },
                    ),
                    TextFormField(
                      controller: textEditingControllerPhone,
                      decoration: InputDecoration(hintText: "Número do contato", labelText: "Número"),
                      keyboardType: TextInputType.phone,
                      onSaved: (newValue) {
                        _contact.telefone = newValue ?? '';
                      },
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(onPressed: () {
                    textEditingControllerName.clear();
                    textEditingControllerPhone.clear();
                  }, icon: Icon(Icons.remove), label: const Text("LIMPAR CAMPOS")
                ),
              ),
              ElevatedButton.icon(
                label: Text("DELETAR CONTATO"),
                icon: Icon(Icons.delete),
                onPressed: () {
                  Contato removedObject = controllerContact.remover(index);
                  print("removeu? ${removedObject}");
                  textEditingControllerName.clear();
                  textEditingControllerPhone.clear();
                  Get.back();
                },
              ),
              Expanded(child: SizedBox()),
              Center(
                child: ElevatedButton.icon(
                  label: Text("EDITAR CONTATO"),
                  icon: Icon(Icons.change_circle),
                  onPressed: () {
                    _formKey.currentState!.save();
                    _contact.nome = textEditingControllerName.text;
                    _contact.telefone = textEditingControllerPhone.text;
                    controllerContact.editar(index, _contact);
                    Get.snackbar("Atualizado com sucesso", "Legal!",
                      colorText: Colors.white,
                      backgroundColor: Colors.lightBlue,
                      icon: const Icon(Icons.add_alert),
                    );
                  },
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
