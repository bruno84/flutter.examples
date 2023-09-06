import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'entity/contact.dart';
import 'controller/controllercontact.dart';

class ViewUpdateContact extends StatelessWidget {
  ViewUpdateContact({super.key});
  final _formKey = GlobalKey<FormState>();
  final Contact _contact = Contact('', '', false);
  final TextEditingController textEditingControllerName = TextEditingController(),
  textEditingControllerPhone = TextEditingController();
  //nome da rota. Static para ser acessível facilmente e compartilhado.
  static const String routeName = '/update';
  final controllerContact = Get.find<ControllerContact>();

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments;
    Contact contact = controllerContact.contacts[index];
    textEditingControllerName.text = contact.name;
    textEditingControllerPhone.text = contact.phone;
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
              SizedBox(
                height: 24,
              ),
              Text(
                'Atualizar contato',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEditingControllerName,
                      decoration: InputDecoration(
                          hintText: "Nome do contato", labelText: "Nome"),
                           onSaved: (newValue) {
                        _contact.name = newValue ?? '';
                      },
                    ),
                    TextFormField(
                      controller: textEditingControllerPhone,
                      decoration: InputDecoration(
                          hintText: "Número do contato", labelText: "Número"),
                      keyboardType: TextInputType.phone,
                      onSaved: (newValue) {
                        _contact.phone = newValue ?? '';
                      },
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(onPressed: (){
                  textEditingControllerName.clear();
                  textEditingControllerPhone.clear();
                }, icon: Icon(Icons.remove), label: const Text("LIMPAR CAMPOS")),
                ),
                ElevatedButton.icon(
                onPressed: () {
                  Contact removedObject = controllerContact.remove(index);
                  print("removeu? ${removedObject}");
                  textEditingControllerName.clear();
                  textEditingControllerPhone.clear();
                  Get.back();
                },
                icon: Icon(Icons.delete),
                label: Text("DELETAR CONTATO"),
                
              ),
              Expanded(child: SizedBox()),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    _formKey.currentState!.save();
                    _contact.name = textEditingControllerName.text;
                    _contact.phone = textEditingControllerPhone.text;
                    controllerContact.updateContact(index, _contact);
                    Get.snackbar(
                'Atualizado com sucesso',
                "",
                colorText: Colors.white,
                backgroundColor: Colors.lightBlue,
                icon: const Icon(Icons.add_alert),
              );
                  },
                  icon: Icon(Icons.change_circle),
                  label: Text("EDITAR CONTATO"),
                 
                ),
              ),
              SizedBox(height: 24,),
            ],
          ),
        ),
      ),
    );
  }
}
