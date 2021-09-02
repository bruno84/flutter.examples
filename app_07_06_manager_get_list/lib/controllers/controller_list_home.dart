import 'package:app_07_06_manager_get_list/model/conteudo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerListHome extends GetxController
{
  List<Conteudo> _listContHome = [
    Conteudo("Conteudo1", "assets/images/image1.jpg"),
    Conteudo("Conteudo2", "assets/images/image2.jpg"),
    Conteudo("Conteudo3", "assets/images/image3.jpg"),
    Conteudo("Conteudo4", "assets/images/image4.jpg")
  ];

  List<Conteudo> get listContHome => _listContHome;

  void addHome(Conteudo conteudo) {
    _listContHome.add(conteudo);
    update(); //Atualiza a tela
  }

  void removeHome(Conteudo conteudo) {
    _listContHome.remove(conteudo);
    update(); //Atualiza a tela
  }


  @override
  void onInit() { // chamado quando o widget é alocado na memória
    print("ControllerListHome: onInit()");
    super.onInit();
  }

  @override
  void onReady() { // chamado quando o widget é renderizado na tela
    print("ControllerListHome: onReady()");
    super.onReady();
  }

  @override
  void onClose() { // chamado quando o widget é removido da memória
    print("ControllerListHome: onClose()");
    super.onClose();
  }

}
