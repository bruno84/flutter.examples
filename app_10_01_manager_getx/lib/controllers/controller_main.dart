import 'dart:ui';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerMain extends GetxController
{
  Brightness _brightness = Brightness.dark;

  Brightness get brightness => this._brightness;

  void changeBrightness()
  {
    if (_brightness == Brightness.dark) {
      _brightness = Brightness.light;
    } else {
      _brightness = Brightness.dark;
    }
    update();
  }
}
