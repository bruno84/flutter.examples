import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("App 02-01 - Image"),
      ),
      body: _body(),
    );
  }

  // Center: componente que centraliza componente filho
  // SizedBox: componente para ocupar tela do componente pai
  _body() {
    return Container(
      color: Colors.white,
      //height: 600,
      //width: 300,
      //child: SizedBox.expand(
      child: Center(
        child: _pageView(),
      ),
    );
  }

  // ATENÇÃO! é preciso colocar o PageView em um Container para definir altura.

  // padding: espaço "da borda para dentro"
  // margin: espaço "da borda para fora"
  // OBS: 16px é a margem minima recomendada no material design.
  _pageView() {
    return Container(
      height: 300,
      color: Colors.red,
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.all(16),
      child: PageView(
        children: [
          _imgAsset("assets/images/image1.jpg"),
          _imgAsset("assets/images/image2.jpg"),
          _imgAsset("assets/images/image3.jpg"),
          _imgNetwork("https://i2.wp.com/assecom.ufersa.edu.br/wp-content/uploads/sites/24/2014/09/PNG-bras%C3%A3o-Ufersa.png?resize=194%2C300&ssl=1"),
          _imgNetwork("https://i0.wp.com/assecom.ufersa.edu.br/wp-content/uploads/sites/24/2018/01/assinatura_completa_cor_RGB-1-e1516038703426.png?resize=300%2C90&ssl=1"),
        ],
      ),
    );
  }

  /*
    HABILITAR ASSETS:
      1) Criar pastas: assets/images/
      2) Editar: pubspec.yaml:
      3) Descomentar: "assets:" e "- assets/images/" com identacao
      4) Clicar em "Get dependecies"
      5) Se não funcionar: Tools -> Flutter -> flutter clean
  */
  _imgAsset(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }

  _imgNetwork(String url) {
    return Image.network(
      url,
      fit: BoxFit.contain,
    );
  }



}
