import 'dart:convert';
import 'package:guia5/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
 User objUser = User();
      objUser.addUser("","Prueba","Flutter","prueba@gmail.com","1234","1");

}

class User{
  final String _url1="http://localhost:3000/controller/usuario.php";
  Future<bool> addUser(
      String usu_id,
      String usu_nom,
      String usu_ape,
      String usu_correo,
      String usu_pass,
      String rol_id) async{

    try {
      final url=Uri.parse('$_url1?op=guardaryeditar&usu_id=$usu_id&usu_nom=$usu_nom'
          '&usu_ape=$usu_ape&usu_correo=$usu_correo'
          '&usu_pass=$usu_pass&rol_id=$rol_id');

      final resp=await http.get(url);
      final decodedData=json.decode(resp.body);
      print(decodedData);
      if (resp.statusCode==200) {
        print("State : ${resp.statusCode} ");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
}
