import 'package:flutter/material.dart';

class Sesion2HyG extends StatefulWidget {
  @override
  _Sesion2HyGState createState() => _Sesion2HyGState();
}

class _Sesion2HyGState extends State<Sesion2HyG> {
  bool task1Completed = false;
  bool task2Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas Sesión 2'),
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
              'Pregunta: ¿Cuál fue la causa principal de la Primera Guerra Mundial?',
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
              'Pregunta: Explica la influencia de los ríos en la geografía de Europa.',
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
