import 'package:app_07_05_manager_get/controllers/controller_home.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingHome implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerHome() );
  }
}
