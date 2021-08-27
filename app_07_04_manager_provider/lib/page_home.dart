import 'package:app_07_04_manager_provider/providers/provider_contador.dart';
import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageHome'),
      ),
      body: _body(context)
    );
  }

  _body(BuildContext context)
  {
    return ListView(
      children:
      [
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Text("Contator: ${ProviderContador.of(context)?.estado.valor}")
        ),

        ElevatedButton(
            child: Text('+ home'),
            onPressed: () => _onClickFabPlusHome(context)
        ),

        SizedBox(
          height: 20,
          width: 20,
        ),

        ElevatedButton(
            child: Text('+ pg1'),
            onPressed: () => _onClickFabPlusPg1(context)
        ),

      ],
    );
  }


  //----------------------------------------------------------------------------
  // EVENTOS
  //----------------------------------------------------------------------------
  _onClickFabPlusHome(BuildContext context) {
    print("Adicionar em Home");
    print(  ProviderContador.of(context) );
    ProviderContador.of(context)?.estado.inc();
    print("Contator: ${ProviderContador.of(context)?.estado.valor}");

  }

  _onClickFabPlusPg1(BuildContext context) {
    print("Adicionar em Pg1");
    print(  ProviderContador.of(context) );
  }


}