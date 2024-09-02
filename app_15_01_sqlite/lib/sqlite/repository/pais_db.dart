import 'package:app_15_01_sqlite/model/pais.dart';
import 'package:app_15_01_sqlite/sqlite/dao/pais_dao.dart';
import '../dao/generic_dao.dart';

class PaisDb extends GenericDao<Pais> {
  // chama construtor da classe pai GenericDao
  // Informa qual o DAO referente a esta classe entidade
  PaisDb() : super(PaisDao());
}
