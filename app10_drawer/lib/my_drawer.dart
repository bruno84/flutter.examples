import 'package:flutter/material.dart';

// ListView: adiciona elementos como lista e com scroll.
// UserAccountsDrawerHeader: componente com modelo de perfil de usuario.
// ListTile: componente com modelo de item de menu.
// InkWell: componente que adiciona onTap em outros componentes.
class MyDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: ListView(
        children: [

          InkWell(
            onTap: () {
              print("Cliquei na caixa do usuário");
              Navigator.pop(context);
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green
              ),
              accountName: Text("Bruno Monteiro"),
              accountEmail: Text("brunomonteiro@ufersa.edu.br"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i2.wp.com/assecom.ufersa.edu.br/wp-content/uploads/sites/24/2014/09/PNG-bras%C3%A3o-Ufersa.png?resize=194%2C300&ssl=1"),
              ),
              onDetailsPressed: () {
                print("Cliquei nas infos do Usuario");
                Navigator.pop(context);
              },
            ),
          ),

          ListTile(
            tileColor: Colors.yellow,
            leading: Icon(Icons.star),
            title: Text("title 1"),
            subtitle: Text("subtitle 1"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 1");
              Navigator.pop(context);
            },
          ),

          ListTile(
            enabled: false,
            leading: Icon(Icons.help),
            title: Text("title 2"),
            subtitle: Text("subtitle 2"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 2");
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("title 3"),
            subtitle: Text("subtitle 3"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              print("Item 3");
              Navigator.pop(context);
            },
          )

        ],
      ),
    );
  }

}