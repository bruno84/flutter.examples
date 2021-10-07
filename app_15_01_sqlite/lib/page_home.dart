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
  void initState()
  {
    super.initState();

    initListPais();
    initListEstado();
    str = "vazio";
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

    var listPaisFut = paisDb.getAll();
    var listPais;
    listPaisFut.then((retorno)  =>  listPais = retorno);

    Estado estado = Estado(id: 0, nome: 'NOVO', sigla: 'NV', pais: listPais[0]);
    estadoDb.insert(estado);
  }

  Future<void> _onClickReadEstado() async
  {
    print("_onClickReadEstado");

    var listFut = estadoDb.getAll();
    var list;
    listFut.then((retorno)  =>  list = retorno);

    setState(() {
      str = list.toString();
    });
  }

  Future<void> _onClickUpdateEstado() async
  {
    print("_onClickUpdateEstado");

    var listFut = estadoDb.getAll();
    var list;
    listFut.then((retorno)  =>  list = retorno);
    Estado estado = list[0];
    estado.nome = estado.nome + "MODIF";
    estadoDb.update(estado);
  }

  Future<void> _onClickDeleteEstado() async
  {
    print("_onClickDeleteEstado");

    var listFut = estadoDb.getAll();
    var list;
    listFut.then((retorno)  =>  list = retorno);
    Estado estado = list[0];
    estadoDb.delete(estado);
  }

  //----------------------------------------------------------------------------
  // DADOS INICIAIS
  //----------------------------------------------------------------------------
  initListPais()
  {
    print("initListPais");

    List<Pais> list = [
      Pais(id: 0, nome: 'Brasil'),
      Pais(id: 1, nome: 'Espanha'),
      Pais(id: 2, nome: 'Argentina'),
    ];

    for(Pais obj in list) {
      paisDb.insert(obj);
      print(obj.toString());
    }

    return list;
  }

  initListEstado()
  {
    print("initListEstado");

    var listPaisFut = paisDb.getAll();
    var listPais;
    listPaisFut.then((retorno)  =>  listPais = retorno);

    List<Estado> list = [
      Estado(id: 0, nome: 'Pernambuco', sigla: 'PE', pais: listPais[0]),
      Estado(id: 1, nome: 'Ceará',      sigla: 'CE', pais: listPais[0]),
      Estado(id: 2, nome: 'Barcelona',  sigla: 'PB', pais: listPais[1]),
    ];

    for(Estado obj in list) {
      estadoDb.insert(obj);
      print(obj.toString());
    }
  }
}