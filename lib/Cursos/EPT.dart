import 'package:flutter/material.dart';
import 'package:guia5/ListaCursos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:guia5/Preguntas/PreguntasEPT/Sesion1EPT.dart';
import 'package:guia5/Preguntas/PreguntasEPT/Sesion2EPT.dart';
import 'package:guia5/Preguntas/PreguntasEPT/Sesion3EPT.dart';
import 'package:guia5/Preguntas/PreguntasEPT/Sesion4EPT.dart';
import 'package:guia5/Preguntas/PreguntasEPT/Sesion5EPT.dart';
import 'package:url_launcher/url_launcher.dart';


void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void main() => runApp(EPT());

class EPT extends StatelessWidget {
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
      'tareasPage': Sesion1EPT(),
    },
    {
      'title': 'Sesión 02',
      'description': '15 de mayo de 2024',
      'date': 'Introducción al Mundo Laboral',
      'isCompleted': false,
      'tareasPage': Sesion2EPT(),
    },
    {
      'title': 'Sesión 03',
      'description': '20 de mayo de 2024',
      'date': 'Habilidades Técnicas y Profesionales',
      'isCompleted': false,
      'tareasPage': Sesion3EPT(),
    },
    {
      'title': 'Sesión 04',
      'description': '25 de mayo de 2024',
      'date': 'Ética y Responsabilidad Profesional',
      'isCompleted': false,
      'tareasPage': Sesion4EPT(),
    },
    {
      'title': 'Sesión 05',
      'description': '30 de mayo de 2024',
      'date': 'Emprendimiento y Gestión Empresarial',
      'isCompleted': false,
      'tareasPage': Sesion5EPT(),
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
            'EPT',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/EPT.jpg',
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
            'El curso de EPT tiene como objetivo principal desarrollar competencias laborales y habilidades prácticas en los estudiantes, preparándolos para enfrentar los desafíos del mundo del trabajo. El curso busca fomentar la responsabilidad, la ética profesional y la capacidad de trabajar en equipo, así como proporcionar una comprensión de los derechos y deberes laborales.',
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
                    return Column(
                      children: [
                        ListContainer(
                          title: session['title'],
                          description: session['description'],
                          date: session['date'],
                          isCompleted: session['isCompleted'],
                          tareasPage: session['tareasPage'],
                        ),
                        if (session['title'] == 'Sesión 01')
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(
                                  0xFF00B9A3)), // Color de fondo del botón
                            ),
                            onPressed: () {
                              _launchURL('http://localhost:3000/public/document/26/HistoriadelPerú.pdf');
                            },
                            child: Text(
                              'PPT Sesión 1 EPT',
                              style: TextStyle(color: Colors.white), // Color del texto blanco
                            ),
                          ),
                        SizedBox(height: 8),
                        if (session['title'] == 'Sesión 02')
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Color(
                                  0xFF00B9A3)), // Color de fondo del botón
                            ),
                            onPressed: () {
                              _launchURL('http://localhost:3000/public/document/27/Informe%20Acad%C3%A9mico%20G3%20APP.pdf');
                            },
                            child: Text(
                              'PPT Sesión 2 EPT',
                              style: TextStyle(color: Colors.white), // Color del texto blanco
                            ),
                          ),
                        SizedBox(height: 20),
                      ],
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



