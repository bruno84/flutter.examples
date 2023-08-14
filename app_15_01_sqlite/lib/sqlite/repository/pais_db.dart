import 'package:app_15_01_sqlite/model/pais.dart';
import 'package:app_15_01_sqlite/sqlite/dao/pais_dao.dart';
import 'generic_dao.dart';

class PaisDb extends GenericDao<Pais> {
  PaisDb() : super(PaisDao());
}
