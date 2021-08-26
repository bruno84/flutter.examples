import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller2 extends GetxController
{
  int _counter = 0;

  int get counter => this._counter;

  void incrementCounter() {
    _counter++;
    update(); //Atualiza a tela
  }
}
