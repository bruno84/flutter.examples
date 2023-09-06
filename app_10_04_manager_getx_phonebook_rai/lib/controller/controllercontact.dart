import 'package:get/get.dart';
import 'package:phonebook/entity/contact.dart';

class ControllerContact extends GetxController{
 RxList<Contact> _contacts = <Contact>[].obs;
 
  add(Contact c){
    _contacts.add(c);
  } 

  Contact remove(int index){
    return _contacts.removeAt(index);
  }

  updateContact(int index, Contact c){
    _contacts[index] = c;
  }

  removeAll(){
    _contacts.clear();
  }
  
  List<Contact> get contacts =>  _contacts.toList();
}