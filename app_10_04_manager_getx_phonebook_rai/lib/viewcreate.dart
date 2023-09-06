import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'entity/contact.dart';
import 'controller/controllercontact.dart';

class ViewAddContact extends StatelessWidget {
  ViewAddContact({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingControllerName =
          TextEditingController(),
      textEditingControllerPhone = TextEditingController();
  //nome da rota. Static para ser acessível facilmente e compartilhado.
  static const String routeName = '/add';
  final controllerContact = Get.find<ControllerContact>();

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 24,
              ),
              Text(
                'Adicionar contato',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEditingControllerName,
                      decoration: const InputDecoration(
                          hintText: "Nome do contato", labelText: "Nome"),
                     
                    ),
                    TextFormField(
                      controller: textEditingControllerPhone,
                      decoration: const InputDecoration(
                          hintText: "Número do contato", labelText: "Número"),
                      keyboardType: TextInputType.phone,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                    onPressed: () {
                      textEditingControllerName.clear();
                      textEditingControllerPhone.clear();
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text("LIMPAR CAMPOS")),
              ),
              const Expanded(child: SizedBox()),
              ElevatedButton.icon(
                onPressed: () {
                  _formKey.currentState!.save();
                  
  final Contact _contact = Contact(textEditingControllerName.text, textEditingControllerPhone.text, false);
                  controllerContact.add(_contact);
                  Get.snackbar(
                    'Cadastrado com sucesso!',
                    "",
                    colorText: Colors.black87,
                    backgroundColor: Colors.greenAccent,
                    icon: const Icon(Icons.add_alert),
                  );
                  textEditingControllerName.clear();
                  textEditingControllerPhone.clear();
                },
                icon: const Icon(Icons.add),
                label: const Text("CRIAR CONTATO"),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
