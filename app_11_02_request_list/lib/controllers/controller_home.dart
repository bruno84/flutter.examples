import 'package:app_11_02_request_list/connection/connection_api.dart';
import 'package:app_11_02_request_list/model/conteudo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerHome extends GetxController
{
  List<Conteudo> _listContent = [];

  List<Conteudo> get listContHome => _listContent;

  void loadListContent() async
  {
    _listContent = await ConnectionApi.getListConteudo(); // retorna Future<List<Conteudo>>
  }

  @override
  void onInit() { // chamado quando o widget é alocado na memória
    print("ControllerHome: onInit()");
    super.onInit();

    loadListContent();
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
