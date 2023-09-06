import 'package:app_10_02_manager_get_list/model/conteudo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerListFav extends GetxController
{
  List<Conteudo> _listContFav = [
    Conteudo("Conteudo5", "assets/images/image5.jpg"),
    Conteudo("Conteudo6", "assets/images/image6.jpg")
  ];

  List<Conteudo> get listContFav => _listContFav;

  void addFav(Conteudo conteudo) {
    _listContFav.add(conteudo);
    update(); //Atualiza a tela
  }

  void removeFav(Conteudo conteudo) {
    _listContFav.remove(conteudo);
    update(); //Atualiza a tela
  }


  @override
  void onInit() { // chamado quando o widget é alocado na memória
    print("ControllerListFav: onInit()");
    super.onInit();
  }

  @override
  void onReady() { // chamado quando o widget é renderizado na tela
    print("ControllerListFav: onReady()");
    super.onReady();
  }

  @override
  void onClose() { // chamado quando o controlador é removido da memória
    print("ControllerListFav: onClose()");
    super.onClose();
  }


}
