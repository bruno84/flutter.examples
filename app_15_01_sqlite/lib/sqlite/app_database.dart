import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dao/estado_dao.dart';
import 'dao/pais_dao.dart';

Future<Database> getDatabase() async
{
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bruno1.db');
  // Abrir painel: View -> Device Explorer
  // Salvo em: data/data/<package_name>/databases
  // Exemplo de programa para abrir db files: sqlitebrowser.org
  // Exemplo de sistema web para abrir db files: inloop.github.io/sqlite-viewer

  return await openDatabase(
      path, onCreate: (db, version)
      {
        db.execute(PaisDao().createTableQuery);
        db.execute(EstadoDao().createTableQuery);
      },
      version: 1
  );
}
