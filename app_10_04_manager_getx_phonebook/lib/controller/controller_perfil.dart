import 'package:get/get.dart';
import '../model/perfil.dart';

class ControllerPerfil extends GetxController
{
  // Atributo observável
  var _perfilObs  = Perfil().obs;
  // Atributo público
  Perfil get perfil => _perfilObs.value;

  editar({String ? nome, String ? foto, int ? idade})
  {
    _perfilObs.update( (val) {
      val!.nome = nome ?? val.nome;
      val.foto  = foto ?? val.foto;
      val.idade = idade ?? val.idade;
    });
  }

}