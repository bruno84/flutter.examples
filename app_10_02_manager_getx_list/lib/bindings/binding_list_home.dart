import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/instance_manager.dart';
import '../controllers/controller_list_fav.dart';
import '../controllers/controller_list_home.dart';

// Especifica quais controladores serão utilizados em cada tela.
class BindingListHome implements Bindings
{
  @override
  void dependencies() {
    Get.put( ControllerListHome() ); // default
    Get.put( ControllerListFav() );
  }
}
