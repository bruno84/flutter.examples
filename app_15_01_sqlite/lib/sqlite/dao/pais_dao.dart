import 'package:app_15_01_sqlite/model/pais.dart';
import 'package:sqflite/sqlite_api.dart';
import '../app_database.dart';
import 'interface_dao.dart';

class PaisDao implements InterfaceDao<Pais>
{
  @override
  final tableName = 'pais';

  @override
  final String id = 'id';
  final String _nome = 'nome';

  static PaisDao instance() {
    return PaisDao();
  }

  @override
  String get createTableQuery => "CREATE TABLE $tableName("
      " $id INTEGER PRIMARY KEY,"
      " $_nome TEXT)";

  @override
  String get deleteAllRowsQuery => "DELETE FROM $tableName";

  @override
  Future<Pais> fromMap(Map<String, dynamic> query) async {
    return Pais.fromJson(query);
  }

  @override
  Map<String, dynamic> toMap(Pais object) {
    return object.toJson();
  }

  @override
  Future<List<Pais>> fromList(List<Map<String, dynamic>> query) async {
    List<Pais> objList = [];
    for (Map<String, dynamic> map in query) {
      objList.add(await fromMap(map));
    }
    return objList;
  }

  @override
  Future<Pais?> getObj(String objId) async {
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
