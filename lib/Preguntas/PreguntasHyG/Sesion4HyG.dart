import 'package:flutter/material.dart';

class Sesion4HyG extends StatefulWidget {
  @override
  _Sesion4HyGState createState() => _Sesion4HyGState();
}

class _Sesion4HyGState extends State<Sesion4HyG> {
  bool task1Completed = false;
  bool task2Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas Sesión 4'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tarea 1',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 8),
            Text(
              'Pregunta: ¿Cuál fue el papel de la Revolución Industrial en la historia?',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  task1Completed = text.isNotEmpty;
                });
              },
              decoration: InputDecoration(hintText: 'Escribe tu respuesta aquí'),
            ),
            SizedBox(height: 16),
            Text(
              'Tarea 2',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 8),
            Text(
              'Pregunta: Explica la influencia de los océanos en el clima mundial.',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  task2Completed = text.isNotEmpty;
                });
              },
              decoration: InputDecoration(hintText: 'Escribe tu respuesta aquí'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: task1Completed && task2Completed
                  ? () {
                Navigator.pop(context, true);
              }
                  : null,
              child: Text('Enviar Tareas'),
            ),
          ],
        ),
      ),
    );
  }
}
