import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'Perfil.dart';
import 'Contacto.dart';
import 'main.dart';
import 'ListaCursos.dart';
import 'API/GraficamenteMantenimientoUsuario.dart';
import 'ListaTickets.dart';

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
                    color: Color(0xFF580001),
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
                                child: Image.asset(
                                  'assets/doramayer2.jpg', // Ruta de la imagen
                                  width: 50, // Ancho deseado
                                  height: 50, // Alto deseado
                                  fit: BoxFit.cover, // Cómo ajustar la imagen
                                ),
                              ),
                              Text(
                                "I. E. DORA MAYER",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
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
                  title: Text(
                    "Inicio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.home_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage(title: 'Home')));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Perfil",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.account_circle, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyPerfilWidget()));
                  },
                ),

                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Lista de Cursos",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.library_books, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListaCursos()));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Contacto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.contact_page_rounded, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Contacto()));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "CRUD-Usuarios",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.build_circle, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MantenimientoUsu()));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Tickets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.build_circle, color: Colors.black),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ListaTickets()));
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  title: Text(
                    "Salir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Hace el texto más grueso
                      fontSize: 16, // Ajusta el tamaño del texto si es necesario
                    ),
                  ),
                  leading: Icon(Icons.exit_to_app_rounded, color: Colors.black),
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


