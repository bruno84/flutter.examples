import 'package:app_07_05_manager_get/controllers/controller1.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

// Especifica quais controladores serão utilizados em cada tela.
class Binding1 implements Bindings
{
  @override
  void dependencies() {
    Get.put( Controller1() );
  }
}