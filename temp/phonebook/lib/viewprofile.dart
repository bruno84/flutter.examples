import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/controllerprofile.dart';

class ViewProfile extends StatelessWidget {
  ViewProfile({super.key});
  final controllerProfile = Get.find<ControllerProfile>();
   static const String routeName = '/profile';
   final _formKey = GlobalKey<FormState>();
final  TextEditingController textEditingControllerName = TextEditingController(),
  textEditingControllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                    Obx((){
            return Column(
              children: [
                Image.network(
                  controllerProfile.profile.photo
                ),
                const SizedBox(height: 12,),
                Text(controllerProfile.profile.name,
                style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("${controllerProfile.profile.age} anos",
                style: Theme.of(context).textTheme.titleMedium,
                ),
                Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textEditingControllerName,
                        decoration: const InputDecoration(
                            hintText: "Nome", labelText: "Nome"),
                      ),
                      TextFormField(
                        controller: textEditingControllerAge,
                        decoration: const InputDecoration(
                            hintText: "Idade", labelText: "Idade"),
                        keyboardType: TextInputType.phone,
                      
                      ),
                      const SizedBox(height: 12,),
                      ElevatedButton.icon(
                onPressed: () {
                
                  controllerProfile.updateProfile(
                    name: textEditingControllerName.text,
                  age: int.parse(textEditingControllerAge.text),
                  );
                  Get.snackbar(
  'Atualizado com sucesso',
  "",
  colorText: Colors.white,
  backgroundColor: Colors.lightBlue,
  icon: const Icon(Icons.add_alert),
);
                },
                icon: const Icon(Icons.change_circle),
                label: const Text("EDITAR PERFIL"),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith((states) {
                    return const Size.fromHeight(48);
                  }),
                  elevation: MaterialStateProperty.resolveWith((states) {
                    return 0;
                  }),
                  shape: MaterialStateProperty.resolveWith((states) {
                    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(24));
                  }),
                ),
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