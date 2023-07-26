import 'package:app_10_02_manager_get_list/controllers/controller_list_home.dart';
import 'package:app_10_02_manager_get_list/controllers/controller_list_fav.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingListHome implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerListHome() ); // default

    Get.put( ControllerListFav() );
  }
}
