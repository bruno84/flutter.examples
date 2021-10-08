import 'package:app_15_01_sqlite/model/estado.dart';
import 'package:app_15_01_sqlite/sqlite/dao/pais_dao.dart';
import 'package:sqflite/sqlite_api.dart';
import '../app_database.dart';
import 'dao.dart';

class EstadoDao implements Dao<Estado>
{
  @override
  final tableName = 'estado';

  @override
  final String id = 'id';
  final String _nome = 'nome';
  final String _sigla = 'sigla';
  final String _paisId = 'pais';

  static EstadoDao instance() {
    return EstadoDao();
  }

  @override
  String get createTableQuery => "CREATE TABLE $tableName("
      " $id INTEGER PRIMARY KEY,"
      " $_nome TEXT,"
      " $_sigla TEXT,"
      " $_paisId TEXT)";

  @override
  String get deleteAllRowsQuery => "DELETE FROM $tableName";

  @override
  Future<Estado> fromMap(Map<String, dynamic> query) async {
    Map<String, dynamic>? estadoJson = Map.of(query);
    estadoJson[_paisId] = await PaisDao.instance().getObjMap(query[_paisId]);
    return Estado.fromJson(estadoJson);
  }

  @override
  Map<String, dynamic> toMap(Estado obj) {
    Map<String, dynamic> jsonMap = obj.toJson();
    jsonMap[_paisId] = obj.pais.id;
    return jsonMap;
  }

  @override
  Future<List<Estado>> fromList(List<Map<String, dynamic>> query) async {
    List<Estado> objList = [];
    for (Map<String, dynamic> map in query) {
      objList.add(await fromMap(map));
    }
    return objList;
  }

  @override
  Future<Estado?> getObj(String objId) async {
    final Database db = await getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$id = ?', whereArgs: [objId]);
    if (maps.isNotEmpty) {
      return fromMap(maps.first);
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> getObjMap(String objId) async {
    final Database db = await getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '$id = ?', whereArgs: [objId]);
    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

}
