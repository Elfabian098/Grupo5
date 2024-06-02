import 'package:flutter/material.dart';

class Sesion5HyG extends StatefulWidget {
  @override
  _Sesion5HyGState createState() => _Sesion5HyGState();
}

class _Sesion5HyGState extends State<Sesion5HyG> {
  bool task1Completed = false;
  bool task2Completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas Sesión 5'),
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
              'Pregunta: ¿Cuáles fueron las causas y consecuencias de la Primera Guerra Mundial?',
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
              'Pregunta: Describe las principales zonas climáticas de África.',
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
