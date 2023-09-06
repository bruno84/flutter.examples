import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerHome extends GetxController
{
  int _valor = 0;

  int get valor => this._valor;

  void inc() {
    _valor++;
    update(); //Atualiza a tela
  }


}
