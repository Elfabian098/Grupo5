import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  Curso curso = Curso();
  //curso.agregarCurso("Arte y Cultura", "Curso sobre arte y cultura");
  curso.listarCursos();
}

class Curso {
  final String baseUrl = "http://localhost:3000/controller/cursos.php";

  Future<bool> agregarCurso(String nombre, String descripcion) async {
    try {
      final url = Uri.parse('$baseUrl?op=guardaryeditar&nombre=$nombre&descripcion=$descripcion');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        print(decodedData); // Maneja la respuesta según tus necesidades
        print("Curso agregado correctamente");
      } else {
        print("Error al agregar curso - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> eliminarCurso(int id) async {
    try {
      final url = Uri.parse('$baseUrl?op=eliminar&id=$id');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        print(decodedData); // Maneja la respuesta según tus necesidades
        print("Curso eliminado correctamente");
      } else {
        print("Error al eliminar curso - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<bool> actualizarCurso(int id, String nombre, String descripcion) async {
    try {
      final url = Uri.parse('$baseUrl?op=guardaryeditar&id=$id&nombre=$nombre&descripcion=$descripcion');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        print(decodedData); // Maneja la respuesta según tus necesidades
        print("Curso actualizado correctamente");
      } else {
        print("Error al actualizar curso - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future<void> listarCursos() async {
    try {
      final url = Uri.parse('$baseUrl?op=listar');
      final resp = await http.get(url);

      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        List<dynamic> cursos = decodedData['aaData'];
        for (var curso in cursos) {
          print('Nombre: ${curso[0]}');
          print('Descripción: ${curso[1]}');
          print('---');
        }
      } else {
        print("Error al listar cursos - Estado: ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
