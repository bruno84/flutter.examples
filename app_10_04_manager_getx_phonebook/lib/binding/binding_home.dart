import 'package:get/get.dart';
import '../controller/controller_contato.dart';

class BindingHome implements Bindings
{
  @override
  void dependencies() {
    Get.put(ControllerContato());
  }
}

