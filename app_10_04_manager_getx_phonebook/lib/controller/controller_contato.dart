import 'package:get/get.dart';
import '../model/contato.dart';

class ControllerContato extends GetxController
{
  // RxList : lista observável
  RxList<Contato> _listaRX = <Contato>[].obs;
  // Atributo público
  List<Contato> get contatos =>  _listaRX.toList();

  adicionar(Contato c){
    _listaRX.add(c);
  } 

  Contato remover(int index){
    return _listaRX.removeAt(index);
  }

  editar(int index, Contato c){
    _listaRX[index] = c;
  }
}