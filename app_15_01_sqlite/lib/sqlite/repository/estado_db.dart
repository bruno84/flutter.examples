import 'package:app_15_01_sqlite/model/estado.dart';
import 'package:app_15_01_sqlite/sqlite/dao/estado_dao.dart';
import '../dao/generic_dao.dart';

class EstadoDb extends GenericDao<Estado> {
  // chama construtor da classe pai GenericDao
  // Informa qual o DAO referente a esta classe entidade
  EstadoDb() : super(EstadoDao());
}
