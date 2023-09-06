import 'package:get/get.dart';
import 'package:phonebook/controller/controllerprofile.dart';


//Torna a classe em um 'ligador' que une controladores às telas
class ProfileBinding implements Bindings {

  //todas as dependências que devem ser inicializadas
  
  @override
  void dependencies() {
    print("binding profile");
    //Marca a necessidade do controlador de contatos nesse bindind.
    //Toda tela que usar o MyHomePageBinding terá o controlador de contatos disponível
    Get.lazyPut<ControllerProfile>(()=>ControllerProfile(),fenix: true);
  }
}