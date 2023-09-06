import 'package:get/get.dart';
import '../entity/profile.dart';

class ControllerProfile extends GetxController{
 var _profile  = Profile().obs;

  updateProfile({String ? name, String ? photo, int ? age}){
    _profile.update((val) {
      val!.name = name ?? val.name;
      val.photo = photo ?? val.photo;
      val.age = age ?? val.age;
    });
  }

  Profile get profile => _profile.value;
}