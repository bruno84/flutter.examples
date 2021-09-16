import 'package:app_11_02_request_list/controllers/controller_home.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingHome implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerHome() ); // default
  }
}
