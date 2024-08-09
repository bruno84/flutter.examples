import 'package:get/get.dart';
import '../controller/controller_perfil.dart';

class BindingPerfil implements Bindings
{
  @override
  void dependencies() {
    Get.put(ControllerPerfil());
  }
}