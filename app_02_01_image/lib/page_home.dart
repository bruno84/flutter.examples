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

  // OBS: 16px é a margem minima recomendada no material design.
  _body()
  {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(16),     // margin: espaço "da borda para fora"
      padding: EdgeInsets.all(50),    // padding: espaço "da borda para dentro"
      child: Center(
        child: _pageView(),
      ),
    );
  }

  // ATENÇÃO! é preciso colocar o PageView em um Container para definir altura.
  _pageView()
  {
    return Container(
      height: 300,
      color: Colors.red,
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
