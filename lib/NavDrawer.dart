import 'package:flutter/material.dart';
import 'package:guia5/Coordinadores.dart';
import 'package:guia5/home.dart';
import 'package:guia5/Perfil.dart';
import 'package:guia5/Contacto.dart';
import 'package:guia5/main.dart';
import 'package:guia5/ListaCursos.dart';

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFAA382E),
            ),
            child: Center(
              child: Column(
                children: [
                  // Primera línea con imagen y texto
                  Container(
                    height: 80, // Altura de la línea
                    color: Colors.transparent, // Color de la línea
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('../assets/dora_mayer.jpg'), // Ruta de la imagen
                            radius: 20, // Tamaño del avatar
                          ),
                        ),
                        Text(
                          "I. E. DORA MAYER",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Segunda línea con icono y texto
                  Container(
                    height: 1, // Altura de la línea
                    color: Colors.transparent, // Color de la línea
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Icon(Icons.account_circle, color: Colors.white, size: 40),
                        flex: 2,
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Nombre Usuario",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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
     builder: (BuildContext context) => MyHomePage(title: 'Dora Mayer')));
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
            title: Text("Lista de Cursos"),
            leading: IconButton(
              icon: Icon(Icons.school),
              onPressed: (){},
            ),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ListaCursos()));
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
