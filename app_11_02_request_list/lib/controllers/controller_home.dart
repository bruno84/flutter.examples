import 'package:app_11_02_request_list/connection/conteudo_api.dart';
import 'package:app_11_02_request_list/model/conteudo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerHome extends GetxController
{
  // Atributos:
  List<Conteudo> _listContent = [];

  // Getters:
  List<Conteudo> get listContHome => _listContent;

  @override
  void onInit() async    // chamado quando o widget é alocado na memória
  {
    print("ControllerHome: onInit()");
    super.onInit();

    _listContent = await ConteudoAPI.getListConteudo();
    update();

    // OBS: assim, o fluxo nao fica esperando os dados serem carregados.
    /*
    ConnectionApi.getListConteudo().then((value) {
      _listContent = value;
      update();
    });
    */
  }

  @override
  void onReady() { // chamado quando o widget é renderizado na tela
    print("ControllerHome: onReady()");
    super.onReady();
  }

  @override
  void onClose() { // chamado quando o controlador é removido da memória
    print("ControllerHome: onClose()");
    super.onClose();
  }

}
