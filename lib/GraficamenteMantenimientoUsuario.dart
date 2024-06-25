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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActualizarEliminarUsuarioPage()),
                );
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
  final String _url1 = "http://localhost:3000/controller/usuario.php";

  Future<bool> addUser(String usu_nom, String usu_ape, String usu_correo, String usu_pass, String rol_id) async {
    try {
      final url = Uri.parse('$_url1?op=guardaryeditar&usu_nom=$usu_nom&usu_ape=$usu_ape&usu_correo=$usu_correo&usu_pass=$usu_pass&rol_id=$rol_id');
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode == 200) {
        print("Usuario agregado correctamente");
      } else {
        print("Error al agregar usuario - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> deleteUser(String usu_id) async {
    try {
      final url = Uri.parse('$_url1?op=eliminar&usu_id=$usu_id');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        print(decodedData);
        print("Usuario eliminado correctamente");
      } else {
        print("Error al eliminar usuario - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> updateUser(String usu_id, String usu_nom, String usu_ape, String usu_correo, String usu_pass, String rol_id) async {
    try {
      final url = Uri.parse('$_url1?op=guardaryeditar&usu_id=$usu_id&usu_nom=$usu_nom&usu_ape=$usu_ape&usu_correo=$usu_correo&usu_pass=$usu_pass&rol_id=$rol_id');
      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode == 200) {
        print("Usuario actualizado correctamente");
      } else {
        print("Error al actualizar usuario - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<List<dynamic>> listUsers() async {
    try {
      final url = Uri.parse('$_url1?op=listar');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        List<dynamic> users = decodedData['aaData'];
        return users;
      } else {
        print("Error al listar usuarios - Estado: ${resp.statusCode}");
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
              onPressed: () {
                User().addUser(
                  nombreController.text,
                  apellidoController.text,
                  correoController.text,
                  passwordController.text,
                  rolController.text,
                );
                Navigator.pop(context);
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
                    DataCell(Text(user[0] ?? '')),
                    DataCell(Text(user[1] ?? '')),
                    DataCell(Text(user[2] ?? '')),
                    DataCell(Text(user[3] ?? '')),
                    DataCell(Text(user[4] ?? '')),
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

class ActualizarEliminarUsuarioPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar/Eliminar Usuario'),
      ),
      drawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID de Usuario'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nuevo Nombre'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: apellidoController,
              decoration: InputDecoration(labelText: 'Nuevo Apellido'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: correoController,
              decoration: InputDecoration(labelText: 'Nuevo Correo'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Nueva Contraseña'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: rolController,
              decoration: InputDecoration(labelText: 'Nuevo ID de Rol'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    User().updateUser(
                      idController.text,
                      nombreController.text,
                      apellidoController.text,
                      correoController.text,
                      passwordController.text,
                      rolController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Actualizar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    User().deleteUser(idController.text);
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text('Eliminar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
