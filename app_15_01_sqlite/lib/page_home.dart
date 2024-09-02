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
  TextEditingController _contID = TextEditingController();
  late String str;

  // repository:
  PaisDb paisDb = PaisDb();
  EstadoDb estadoDb = EstadoDb();

  @override
  void initState() {
    super.initState();
    str = "";
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
            CompTextFormField("ID/Sufixo", "Digite o ID/Sufixo ", _contID, inputType: TextInputType.number),
            SizedBox(height: 20),

            CompElevatedButton("Create Pais", _onClickCreatePais, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Read Pais",   _onClickReadPais, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Update Pais", _onClickUpdatePais, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Delete Pais", _onClickDeletePais, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 20),

            CompElevatedButton("Create Estado (com pais[0])", _onClickCreateEstado, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Read Estado",   _onClickReadEstado, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Update Estado", _onClickUpdateEstado, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 10),
            CompElevatedButton("Delete Estado", _onClickDeleteEstado, height: 30, fontSize: 16, colorBG: Colors.blue),
            SizedBox(height: 20),

            CompElevatedButton("DELETE ALL ROWS", _onClickDeleteAllRows, height: 30, fontSize: 16, colorBG: Colors.red),
            Text( str ),
          ],
        ),
    );
  }

  //----------------------------------------------------------------------------
  // EVENTOS PAIS
  //----------------------------------------------------------------------------
  Future<void> _onClickCreatePais() async
  {
    print("_onClickCreatePais");

    String id = _contID.text;
    Pais pais = Pais(nome: "Pais Novo " + id);
    paisDb.insert(pais);
  }

  Future<void> _onClickReadPais() async
  {
    print("_onClickReadPais");

    List<Pais> list = await paisDb.getAll();
    str = "";

    setState(() {
      for(Pais obj in list) {
        str = str + obj.toString() + "\n";
      }
    });
  }

  Future<void> _onClickUpdatePais() async
  {
    print("_onClickUpdatePais");

    List<Pais> listPais = await paisDb.getAll();
    String idStr = _contID.text;
    int id = int.parse(idStr);
    Pais pais = filterPais(listPais, id)!;

    if(pais != null) {
      pais.nome = pais.nome + " MODIF!";
      await paisDb.update(pais);
    }
  }

  Future<void> _onClickDeletePais() async
  {
    print("_onClickDeletePais");

    List<Pais> listPais = await paisDb.getAll();
    String idStr = _contID.text;
    int id = int.parse(idStr);
    Pais pais = filterPais(listPais, id)!;

    if(pais != null) {
      await paisDb.delete(pais);
    }
  }

  //----------------------------------------------------------------------------
  // EVENTOS ESTADO
  //----------------------------------------------------------------------------
  Future<void> _onClickCreateEstado() async
  {
    print("_onClickCreateEstado");

    String id = _contID.text;
    List<Pais> listPais = await paisDb.getAll();
    Estado estado = Estado(nome: "Estado Novo " + id, sigla: "PN"+id, pais: listPais[0]);
    estadoDb.insert(estado);

  }

  Future<void> _onClickReadEstado() async
  {
    print("_onClickReadEstado");

    List<Estado> list = await estadoDb.getAll();
    str = "";

    setState(() {
      for(Estado obj in list) {
        str = str + obj.toString() + "\n";
      }
    });
  }

  Future<void> _onClickUpdateEstado() async
  {
    print("_onClickUpdateEstado");

    List<Estado> listEstado = await estadoDb.getAll();
    String idStr = _contID.text;
    int id = int.parse(idStr);
    Estado estado = filterEstado(listEstado, id)!;

    if(estado != null) {
      estado.nome = estado.nome + " MODIF!";
      await estadoDb.update(estado);
    }
  }

  Future<void> _onClickDeleteEstado() async
  {
    print("_onClickDeleteEstado");

    List<Estado> listEstado = await estadoDb.getAll();
    String idStr = _contID.text;
    int id = int.parse(idStr);
    Estado estado = filterEstado(listEstado, id)!;

    if(estado != null) {
      await estadoDb.delete(estado);
    }
  }

  //----------------------------------------------------------------------------
  // EVENTOS BD
  //----------------------------------------------------------------------------
  Future<void> _onClickDeleteAllRows() async
  {
    print("_onClickDeleteAllRows");
    estadoDb.deleteAll();
    paisDb.deleteAll();
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

  //----------------------------------------------------------------------------
  // UTEIS
  //----------------------------------------------------------------------------
  Pais? filterPais(List<Pais> list, int id)
  {
    for(Pais obj in list) {
      if(obj.id == id) {
        return obj;
      }
    }
    return null;
  }

  Estado? filterEstado(List<Estado> list, int id)
  {
    for(Estado obj in list) {
      if(obj.id == id) {
        return obj;
      }
    }
    return null;
  }

}