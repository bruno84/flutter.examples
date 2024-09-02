
/*
  interface implementada pelas classes DAO das entidades
 */
abstract class InterfaceDao<T>
{
  String get createTableQuery;
  String get deleteAllRowsQuery;
  String get tableName;
  String get id;

  Future<T> fromMap(Map<String, dynamic> query);
  Future<List<T>> fromList(List<Map<String, dynamic>> query);
  Map<String, dynamic> toMap(T object);
  Future<T?> getObj(String id);
  Future<Map<String, dynamic>?> getObjMap(String objId);
}
