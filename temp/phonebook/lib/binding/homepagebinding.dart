import 'package:get/get.dart';

import '../controller/controllercontact.dart';

//Torna a classe em um 'ligador' que une controladores às telas
class HomePageBinding implements Bindings {

  //todas as dependências que devem ser inicializadas
  
  @override
  void dependencies() {
    print("binding home");
    //Marca a necessidade do controlador de contatos nesse bindind.
    //Toda tela que usar o MyHomePageBinding terá o controlador de contatos disponível
    Get.put<ControllerContact>(ControllerContact(),permanent: true);
  }
}

//Apenas exemplos de outros bindings
//
// class HomeBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<HomeController>(() => HomeController());
//     Get.put<Service>(()=> Api());
//   }
// }

// class DetailsBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<DetailsController>(() => DetailsController());
//   }
// }