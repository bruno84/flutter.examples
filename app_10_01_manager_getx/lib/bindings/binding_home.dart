import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

import '../controllers/controller_home.dart';
import '../controllers/controller_main.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingHome implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerHome() ); // default
    Get.put( ControllerMain() );
  }
}
