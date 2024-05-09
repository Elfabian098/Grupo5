import 'package:flutter/material.dart';
import 'package:guia5/Coordinadores.dart';
import 'package:guia5/home.dart';
import 'package:guia5/Perfil.dart';
import 'package:guia5/Contacto.dart';
import 'package:guia5/main.dart';

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Icon(Icons.account_circle, color: Colors.white,size:40,),
                    flex: 2,
                  ),
                  Expanded(flex: 6,
                  child: Text(
                    "FIIS-UNFV",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Inicio"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            onTap: (){
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(
     builder: (BuildContext context) => MyHomePage(title: '"Comunidad Conocimiento I+D+I+Sistemas"')));
  },
            ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Perfil"),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
         builder: (BuildContext context) => Perfil()));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Contacto"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Contacto()));
            },
          ),

          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Coordinadores"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => CoordinadoresPage()));
            },
          ),

          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Salir"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
            },
          )




        ],

      )
    );
  }
}
