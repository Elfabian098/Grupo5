import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  User objUser = User();
  objUser.deleteUser("20"); // Ejemplo de llamada para eliminar un usuario
}

class User {
  final String _url1 = "http://localhost:3000/controller/usuario.php";



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
}
