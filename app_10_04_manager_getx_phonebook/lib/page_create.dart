import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/contato.dart';
import 'controller/controller_contato.dart';

class PageCreate extends StatelessWidget
{
  static const String nomeRota = '/create';

  final controllerContact = Get.find<ControllerContato>();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingControllerNome = TextEditingController();
  final TextEditingController textEditingControllerTelefone = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
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
              Text('Adicionar contato', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textEditingControllerNome,
                      decoration: const InputDecoration(hintText: "Nome do contato", labelText: "Nome"),
                    ),
                    TextFormField(
                      controller: textEditingControllerTelefone,
                      decoration: const InputDecoration(hintText: "Número do contato", labelText: "Número"),
                      keyboardType: TextInputType.phone,
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                    onPressed: () {
                      textEditingControllerNome.clear();
                      textEditingControllerTelefone.clear();
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text("LIMPAR CAMPOS")
                ),
              ),
              Expanded( child: SizedBox() ),
              ElevatedButton.icon( onPressed: () {
                  _formKey.currentState!.save();
                  final Contato _contact = Contato(textEditingControllerNome.text, textEditingControllerTelefone.text, false);
                  controllerContact.adicionar(_contact);
                  Get.snackbar('Cadastrado com sucesso!', "Legal!",
                    colorText: Colors.black87,
                    backgroundColor: Colors.greenAccent,
                    icon: const Icon(Icons.add_alert),
                  );
                  textEditingControllerNome.clear();
                  textEditingControllerTelefone.clear();
                },
                icon: const Icon(Icons.add),
                label: const Text("CRIAR CONTATO"),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
