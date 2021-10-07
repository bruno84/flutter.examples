import 'package:app_15_01_sqlite/model/estado.dart';
import 'package:app_15_01_sqlite/sqlite/dao/estado_dao.dart';
import 'generic_dao.dart';

class EstadoDb extends GenericDao<Estado> {
  EstadoDb() : super(EstadoDao());
}
