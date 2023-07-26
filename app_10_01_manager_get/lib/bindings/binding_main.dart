import 'package:app_10_01_manager_get/controllers/controller_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingMain implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerMain() );
  }
}
