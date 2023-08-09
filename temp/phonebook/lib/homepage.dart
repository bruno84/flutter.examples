import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phonebook/viewprofile.dart';

import 'viewcreate.dart';
import 'controller/controllercontact.dart';
import 'viewupdate.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String routeName = '/';
  final controllerContact = Get.find<ControllerContact>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
                 ElevatedButton.icon(onPressed: (){
            Get.toNamed(ViewProfile.routeName);
          }, icon: Icon(Icons.person), label: Text("Ver meu perfil"),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.redAccent,
            minimumSize: Size.fromHeight(52)
          ),
          ),
          SizedBox(
            height: 12,
          ),
              Text(
                'Agenda Telefônica',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8,),
              
             GetX<ControllerContact>(
                init: controllerContact,
                builder: (controller) {
              return Center(
                child: Text('Há ${controllerContact.contacts.length} contatos',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.grey[500]
                ),
                )
                );
            },
          ),
               
          Obx(() => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            physics:BouncingScrollPhysics(),
            itemCount: controllerContact.contacts.length,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Get.toNamed(ViewUpdateContact.routeName, arguments: index);
                },
                child: ListTile(
                  title: Text("${index + 1} - ${controllerContact.contacts[index].name}"),
                  subtitle: Text(controllerContact.contacts[index].phone),
                ),
              );
            },
            separatorBuilder:(context, int){
              return const Divider(
                thickness: 2,
              );
            },
          )),
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Get.to(ViewAddContact());
        },
        elevation: 0,
        tooltip: 'Increment',
        label: const Text("CRIAR CONTATO"),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
