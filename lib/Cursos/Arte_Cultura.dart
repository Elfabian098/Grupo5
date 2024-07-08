import 'package:flutter/material.dart';
import 'package:guia5/ListaCursos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guia5/Preguntas/PreguntasArtCul/Sesion1ArtCul.dart';
import 'package:guia5/Preguntas/PreguntasArtCul/Sesion2ArtCul.dart';
import 'package:guia5/Preguntas/PreguntasArtCul/Sesion3ArtCul.dart';
import 'package:guia5/Preguntas/PreguntasArtCul/Sesion4ArtCul.dart';
import 'package:guia5/Preguntas/PreguntasArtCul/Sesion5ArtCul.dart';
void main() => runApp(Art_Cul());

class Art_Cul extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Aplicación',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),
          headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black),
          headline3: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          headline4: TextStyle(fontSize: 16, color: Colors.black),
          bodyText1: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey[600]),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Regresar',
          style: TextStyle(color: Colors.white), // Color del texto blanco
        ),
        backgroundColor: Color(0xFF580001), // Cambia el color del AppBar a rojo
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Color del icono blanco
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListaCursos()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: ContentArea(),
      ),
    );
  }
}


class ContentArea extends StatefulWidget {
  @override
  _ContentAreaState createState() => _ContentAreaState();
}

class _ContentAreaState extends State<ContentArea> {
  late Future<void> _loadSessionStatus;

  @override
  void initState() {
    super.initState();
    _loadSessionStatus = _loadAllSessionStatus();
  }

  Future<void> _loadAllSessionStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 1; i <= 5; i++) {
        final isCompleted = prefs.getBool('sesion${i}Completed') ?? false;
        _sessions[i - 1]['isCompleted'] = isCompleted;
      }
    });
  }

  final List<Map<String, dynamic>> _sessions = [
    {
      'title': 'Sesión 01',
      'description': '10 de mayo de 2024',
      'date': 'Introducción al curso',
      'isCompleted': false,
      'tareasPage': Sesion1ArtCul(),
    },
    {
      'title': 'Sesión 02',
      'description': '15 de mayo de 2024',
      'date': 'Arte Antiguo',
      'isCompleted': false,
      'tareasPage': Sesion2ArtCul(),
    },
    {
      'title': 'Sesión 03',
      'description': '20 de mayo de 2024',
      'date': 'Arte Contemporaneo',
      'isCompleted': false,
      'tareasPage': Sesion3ArtCul(),
    },
    {
      'title': 'Sesión 04',
      'description': '25 de mayo de 2024',
      'date': 'Arte Abstracto',
      'isCompleted': false,
      'tareasPage': Sesion4ArtCul(),
    },
    {
      'title': 'Sesión 05',
      'description': '30 de mayo de 2024',
      'date': 'Técnicas de Pincel',
      'isCompleted': false,
      'tareasPage': Sesion5ArtCul(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white, // Color de fondo agregado
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Arte y Cultura',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/arte_cultura.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 16),
          Text(
            'Descripción',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          Text(
              'Este curso de Arte y Cultura está diseñado para ofrecer a los estudiantes una comprensión profunda y amplia de las diversas formas de expresión artística y su impacto en la sociedad a lo largo de la historia. A través de un enfoque interdisciplinario, el curso explora las manifestaciones artísticas desde la antigüedad hasta el presente, incluyendo la pintura, la escultura, la arquitectura, la música, la literatura, el cine y las artes escénicas.',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 16),
          Text(
            'Resumen de sesiones',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TaskDetails(
                  title: '5',
                  description: 'Sesiones Aperturadas',
                ),
                SizedBox(width: 16),
                TaskDetails(
                  title: '5',
                  description: 'Sesiones Actuales',
                ),
                SizedBox(width: 16),
                TaskDetails(
                  title: '0',
                  description: 'Sesiones Completadas',
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Unidades',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          FutureBuilder<void>(
            future: _loadSessionStatus,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Column(
                  children: _sessions.map((session) {
                    return ListContainer(
                      title: session['title'],
                      description: session['description'],
                      date: session['date'],
                      isCompleted: session['isCompleted'],
                      tareasPage: session['tareasPage'],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  final String title;
  final String description;

  TaskDetails({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.2, // Ancho del borde, puedes ajustarlo según tus necesidades
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

class ListContainer extends StatefulWidget {
  final String title;
  final String description;
  final String date;
  final Widget? tareasPage;
  bool isCompleted;

  ListContainer({
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = false,
    this.tareasPage,
  });

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  Future<void> _markSessionAsCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.title.replaceAll(' ', '').toLowerCase()}Completed', true);
    setState(() {
      widget.isCompleted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.3, // Ancho del borde, puedes ajustarlo según tus necesidades
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              if (widget.isCompleted)
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFF00A411),
                    borderRadius: BorderRadius.circular(10), // Define el radio de borde para redondear los bordes
                    border: Border.all( // Define las propiedades del borde
                      color: Colors.black, // Define el color del borde
                      width: 0.5, // Define el ancho del borde
                    ),
                  ),
                  child: Text(
                    'Realizado',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

            ],
          ),
          SizedBox(height: 4),
          Text(
            'Fecha: ${widget.date}',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 4),
          Text(
            widget.description,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 8),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFB90000)), // Color de fondo del botón
            ),
            onPressed: widget.tareasPage != null
                ? () async {
              bool? completed = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget.tareasPage!),
              );
              if (completed != null && completed) {
                await _markSessionAsCompleted();
              }
            }
                : null,
            child: Text(
              'Ir a tareas',
              style: TextStyle(color: Colors.white), // Color del texto blanco
            ),
          ),
        ],
      ),
    );
  }
}



