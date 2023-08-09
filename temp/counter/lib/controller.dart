import 'package:get/get.dart';

class ControllerObx extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class ControllerGetBuilder extends GetxController{
  var count = 0;
  increment(){
    count++;
    update();
    }
}