import 'dart:convert';
import 'package:http/http.dart' as http;

void main(){
 User objUser = User();
      // objUser.addUser("Prueba2","Flutter","prueba@gmail.com","1234","1");
      objUser.listUser();
}

class User {
  final String _url1 = "http://localhost:3000/controller/usuario.php";

  Future<bool> addUser(String usu_nom,
      String usu_ape,
      String usu_correo,
      String usu_pass,
      String rol_id) async {
    try {
      final url = Uri.parse('$_url1?op=guardaryeditar&usu_nom=$usu_nom'
          '&usu_ape=$usu_ape&usu_correo=$usu_correo'
          '&usu_pass=$usu_pass&rol_id=$rol_id');

      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode == 200) {
        print("State : ${resp.statusCode} ");
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
        print(decodedData); // Puedes manejar la respuesta como desees
        print("Usuario eliminado correctamente");
      } else {
        print("Error al eliminar usuario - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> UpdateUser(String usu_id,
      String usu_nom,
      String usu_ape,
      String usu_correo,
      String usu_pass,
      String rol_id) async {
    try {
      final url = Uri.parse(
          '$_url1?op=guardaryeditar&usu_id=$usu_id&usu_nom=$usu_nom'
              '&usu_ape=$usu_ape&usu_correo=$usu_correo'
              '&usu_pass=$usu_pass&rol_id=$rol_id');

      final resp = await http.get(url);
      final decodedData = json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode == 200) {
        print("State : ${resp.statusCode} ");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<void> listUser() async {
    try {
      final url = Uri.parse('$_url1?op=listar');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        List<dynamic> users = decodedData['aaData'];
        for (var user in users) {
          print('Nombre: ${user[0]}');
          print('Apellido: ${user[1]}');
          print('Correo: ${user[2]}');
          print('Password: ${user[3]}');
          print('Rol: ${user[4]}');
          print('---');
        }
      } else {
        print("Error al listar usuarios - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
  }



