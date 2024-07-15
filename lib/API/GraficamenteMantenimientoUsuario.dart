import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:guia5/NavDrawer.dart';

class MantenimientoUsu extends StatelessWidget {
  final User objUser = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Usuarios'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navegar a la página para agregar usuario
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgregarUsuarioPage()),
                );
              },
              child: Text('Agregar Usuario'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página para listar usuarios
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListarUsuariosPage()),
                );
              },
              child: Text('Listar Usuarios'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página para actualizar o eliminar usuario
              },
              child: Text('Actualizar/Eliminar Usuario'),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String _firebaseUrl = "https://mi-proyecto-flutter-237f5-default-rtdb.firebaseio.com/";

  Future<bool> addUser(String usuNom, String usuApe, String usuCorreo, String usuPass, String rolId) async {
    try {
      final url = Uri.parse('$_firebaseUrl/users.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'usu_nom': usuNom,
          'usu_ape': usuApe,
          'usu_correo': usuCorreo,
          'usu_pass': usuPass,
          'rol_id': rolId,
        }),
      );

      if (response.statusCode == 200) {
        print("Usuario agregado correctamente");
        return true;
      } else {
        print("Error al agregar usuario - Estado: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<dynamic>> listUsers() async {
    try {
      final url = Uri.parse('$_firebaseUrl/users.json');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);
        print('Response JSON: $decodedData'); // Imprimir respuesta JSON
        final List<dynamic> users = [];
        decodedData.forEach((key, value) {
          users.add(value);
        });
        return users;
      } else {
        print("Error al listar usuarios - Estado: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}

class AgregarUsuarioPage extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Usuario'),
      ),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: apellidoController,
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: correoController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: rolController,
              decoration: InputDecoration(labelText: 'ID de Rol'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await User().addUser(
                  nombreController.text,
                  apellidoController.text,
                  correoController.text,
                  passwordController.text,
                  rolController.text,
                );
                if (success) {
                  Navigator.pop(context);
                } else {
                  // Manejar el error aquí
                }
              },
              child: Text('Agregar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListarUsuariosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Usuarios'),
      ),
      drawer: NavDrawer(),
      body: FutureBuilder<List<dynamic>>(
        future: User().listUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error al cargar datos'));
            } else {
              List<dynamic> users = snapshot.data ?? [];
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Apellido')),
                    DataColumn(label: Text('Correo')),
                    DataColumn(label: Text('Password')),
                    DataColumn(label: Text('Rol')),
                  ],
                  rows: users
                      .map((user) => DataRow(cells: [
                    DataCell(Text(user['usu_nom']?.toString() ?? '')),
                    DataCell(Text(user['usu_ape']?.toString() ?? '')),
                    DataCell(Text(user['usu_correo']?.toString() ?? '')),
                    DataCell(Text(user['usu_pass']?.toString() ?? '')),
                    DataCell(Text(user['rol_id']?.toString() ?? '')),
                  ]))
                      .toList(),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
