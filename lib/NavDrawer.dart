import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Coordinadores.dart';
import 'home.dart';
import 'Perfil.dart';
import 'Contacto.dart';
import 'main.dart';
import 'ListaCursos.dart';

class NavDrawer extends StatelessWidget {
  Future<String> _cargarPreferencia() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("key1") ?? "No hay datos";
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<String>(
        future: _cargarPreferencia(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFFAA382E),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 80, // Altura de la línea
                          color: Colors.transparent, // Color de la línea
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/dora_mayer.jpg'), // Ruta de la imagen
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
                                "${snapshot.data}", //carga el email
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
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage(title: 'Home')));
                  },
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Perfil"),
                  leading: Icon(Icons.account_circle),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyPerfilWidget()));
                  },
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Contacto"),
                  leading: Icon(Icons.contact_page),
                  onTap: () {
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
                  leading: Icon(Icons.school),
                  onTap: () {
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
                  leading: Icon(Icons.contact_page),
                  onTap: () {
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
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}



