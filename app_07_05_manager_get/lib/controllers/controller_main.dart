import 'dart:ui';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerMain extends GetxController
{
  Brightness brightness = Brightness.dark;

  void changeBrightness()
  {
    if (brightness == Brightness.dark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    update();
  }
}
