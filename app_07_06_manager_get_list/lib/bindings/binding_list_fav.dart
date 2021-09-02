import 'package:app_07_06_manager_get_list/controllers/controller_list_fav.dart';
import 'package:app_07_06_manager_get_list/controllers/controller_list_home.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingListFav implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerListFav() );   // default

    Get.put( ControllerListHome() );
  }
}
