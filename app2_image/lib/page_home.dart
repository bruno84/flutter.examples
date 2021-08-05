import 'package:flutter/material.dart';

class PageHome extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("App2 - Image"),
      ),
      body: _body(),
    );
  }

  // Center: widget para centralizar
  // SizedBox: widget para ocupar tela do componente pai
  _body() {
    return Container(
      color: Colors.white,
      //height: 600,
      //width: 300,
      //child: SizedBox.expand(
      child: Center(
        //child: _imgNetwork(),
        //child: _imgAsset("assets/images/image2.jpg"),
        child: _pageView(),
      ),
    );
  }

  /*
  Habilitar assets:
  Criar pastas: assets/images/
  Editar: pubspec.yaml:
  Descomentar: "assets:" e "- assets/images/" com identacao
  Clicar em "Get dependecies"
  Se não funcionar: Tools -> Flutter -> flutter clean
  */
  _imgAsset(String path) {
    return Image.asset(
      path,
      width: 400,
      height: 200,
      fit: BoxFit.fill,
    );
  }

  _imgNetwork() {
    return Image.network(
      "https://ufersa.edu.br/wp-content/themes/temaufersa/img/ufersa_15anos.png",
      fit: BoxFit.cover,
    );
  }

  // Atencao: é preciso colocar o PageView em um Container para definir altura
  // padding: espaço "da borda para dentro"
  // margin: espaço "da borda para fora"
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
        ],
      ),
    );
  }

}
