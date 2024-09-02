import 'package:app_15_01_sqlite/sqlite/dao/interface_dao.dart';
import 'package:app_15_01_sqlite/sqlite/dao/interface_generic.dart';
import 'package:sqflite/sqlite_api.dart';
import '../app_database.dart';

class GenericDao<T> extends InterfaceGeneric<T>
{
  // atributo (EstadoDao ou PaisDao)
  final InterfaceDao<T> dao;

  // construtor (chamado nas classes em repository)
  GenericDao(this.dao);

  Future<int> insert(T obj) async {
    final Database db = await getDatabase();
    return await db.insert(dao.tableName, dao.toMap(obj));
  }

  Future<int> update(dynamic obj) async {
    final Database db = await getDatabase();
    return await db.update(
      dao.tableName,
      dao.toMap(obj),
      where: dao.id + " = ?",
      whereArgs: [obj.id],
    );
  }

  Future<int> delete(dynamic obj) async {
    final Database db = await getDatabase();
    return await db.delete(dao.tableName, where: dao.id + " = ?", whereArgs: [obj.id]);
  }

  Future<List<T>> getAll() async {
    final Database db = await getDatabase();
    List<Map<String, dynamic>> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }

  void deleteAll() async {
    final Database db = await getDatabase();
    await db.execute(dao.deleteAllRowsQuery);
  }
}
