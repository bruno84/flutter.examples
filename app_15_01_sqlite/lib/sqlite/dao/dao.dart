
abstract class Dao<T>
{
  String get createTableQuery;
  String get tableName;
  String get id;

  // Metodos abstratos de mapeamento
  Future<T> fromMap(Map<String, dynamic> query);
  Future<List<T>> fromList(List<Map<String, dynamic>> query);
  Map<String, dynamic> toMap(T object);
  Future<T?> getObj(String id);
  Future<Map<String, dynamic>?> getObjMap(String objId);
}
