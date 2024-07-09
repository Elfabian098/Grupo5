import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:guia5/NavDrawer.dart';

class ListaTickets extends StatelessWidget {
  final Ticket objUser = Ticket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Tickets'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página para listar usuarios
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListarTicketsPage()),
                );
              },
              child: Text('Listar Tickets'),
            ),
          ],
        ),
      ),
    );
  }
  }


  class Ticket{

  final String _url1 = "http://localhost:3000/controller/ticket.php";

    Future<List<dynamic>> listTickets() async {
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

class ListarTicketsPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Listar Tickets'),
    ),
    drawer: NavDrawer(),
    body: FutureBuilder<List<dynamic>>(
      future: Ticket().listTickets(),
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
                  DataColumn(label: Text('Categoría')),
                  DataColumn(label: Text('Título')),
                  DataColumn(label: Text('Descripción')),
                  DataColumn(label: Text('Estado')),
                  DataColumn(label: Text('Fecha Creado')),
                  DataColumn(label: Text('Soporte')),
                  DataColumn(label: Text('Fecha Asigando')),

                ],
                rows: users
                    .map((ticket) => DataRow(cells: [
                  DataCell(Text(ticket[1] ?? '')),
                  DataCell(Text(ticket[2] ?? '')),
                  DataCell(Text(ticket[3] ?? '')),
                  DataCell(Text(ticket[4] ?? '')),
                  DataCell(Text(ticket[5] ?? '')),
                  DataCell(Text(ticket[6] ?? '')),
                  DataCell(Text(ticket[7] ?? ''))
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

