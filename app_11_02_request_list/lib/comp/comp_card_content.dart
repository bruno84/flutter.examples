
import 'package:app_11_02_request_list/model/conteudo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompCardContent extends StatelessWidget
{
  late Conteudo conteudo;
  
  CompCardContent(this.conteudo);

  @override
  Widget build(BuildContext context)
  {
    return Stack(
        fit: StackFit.expand,
        children:
        [
          //_imgAsset(conteudo.foto),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black)
            ),
          ),

          Container(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text(
                    conteudo.name,
                    style: TextStyle(
                        fontSize: 20, color: Colors.white
                    )
                ),
              )
          )
        ]
    );

  }

  _imgAsset(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }


}


