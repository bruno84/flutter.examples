import 'package:app_15_01_sqlite/sqlite/repository/estado_db.dart';
import 'package:app_15_01_sqlite/sqlite/repository/pais_db.dart';
import 'package:flutter/material.dart';
import 'comp/comp_elevatedbutton.dart';
import 'comp/comp_textformfield.dart';
import 'model/estado.dart';
import 'model/pais.dart';

class PageHome extends StatefulWidget
{
  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
{
  PaisDb paisDb = PaisDb();
  EstadoDb estadoDb = EstadoDb();
  late String str;

  @override
  void initState() {
    super.initState();
    str = "vazio";
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APP 15-01 SQLite"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body()
  {
    return Container(
        padding: EdgeInsets.all(20),  // material design: 16
        child: ListView(
          children: [
            CompElevatedButton("Create Estado", _onClickCreateEstado, height: 40, fontSize: 20, colorBG: Colors.blue),
            SizedBox(height: 20),
            CompElevatedButton("Read Estado",   _onClickReadEstado, height: 40, fontSize: 20, colorBG: Colors.blue),
            SizedBox(height: 20),
            CompElevatedButton("Update Estado", _onClickUpdateEstado, height: 40, fontSize: 20, colorBG: Colors.blue),
            SizedBox(height: 20),
            CompElevatedButton("Delete Estado", _onClickDeleteEstado, height: 40, fontSize: 20, colorBG: Colors.blue),
            SizedBox(height: 20),
            Text( str ),
          ],
        ),
    );
  }

  //----------------------------------------------------------------------------
  // EVENTO
  //----------------------------------------------------------------------------
  Future<void> _onClickCreateEstado() async
  {
    print("_onClickCreateEstado");

    List<Pais> listPais = await paisDb.getAll();
    Estado estado = Estado(id: 0, nome: 'NOVO', sigla: 'NV', pais: listPais[0]);
    estadoDb.insert(estado);
  }

  Future<void> _onClickReadEstado() async
  {
    print("_onClickReadEstado");

    List<Estado> list = await estadoDb.getAll();

    for(Estado obj in list) {
      print(obj.toString());
      str = str + obj.toString() + "\n";
    }

    setState(() {});
  }

  Future<void> _onClickUpdateEstado() async
  {
    print("_onClickUpdateEstado");

    List<Estado> list = await estadoDb.getAll();
    Estado estado = list[0];
    estado.nome = estado.nome + "MODIF";
    await estadoDb.update(estado);
  }

  Future<void> _onClickDeleteEstado() async
  {
    print("_onClickDeleteEstado");

    List<Estado> list = await estadoDb.getAll();
    Estado estado = list[0];
    await estadoDb.delete(estado);
  }

  //----------------------------------------------------------------------------
  // DADOS INICIAIS
  //----------------------------------------------------------------------------
  initDB() async
  {
    print("initDB");

    List<Pais> listPais = [
      Pais(nome: 'P111'),
      Pais(nome: 'P222'),
      Pais(nome: 'P333'),
    ];

    print("criando Paises");
    for(Pais obj in listPais) {
      await paisDb.insert(obj);
      print(obj.toString());
    }

    print("criando Estados");
    List<Estado> listEstado = [
      Estado(nome: 'Est111', sigla: 'E1', pais: listPais[0]),
      Estado(nome: 'Est222', sigla: 'E2', pais: listPais[0]),
      Estado(nome: 'Est333', sigla: 'E3', pais: listPais[1]),
    ];

    for(Estado obj in listEstado) {
      await estadoDb.insert(obj);
      print(obj.toString());
    }

  }


}