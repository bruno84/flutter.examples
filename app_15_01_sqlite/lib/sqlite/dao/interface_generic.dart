
/*
  interface implementada pelas classes DAO das entidades
 */
abstract class InterfaceGeneric<T>
{
  Future<int> insert(T obj);
  Future<int> update(dynamic obj);
  Future<int> delete(dynamic obj);
  Future<List<T>> getAll();
  void deleteAll();
}
