import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¿Estás seguro?'),
        content: Text('¿Quieres salir de la aplicación?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Sí'),
          ),
        ],
      ),
    )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xFF580001), // Cambia el color de la barra de notificaciones
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu, color: Colors.white), // Cambia el color del ícono aquí a blanco
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Implementa la lógica para activar las notificaciones
              },
            ),
            IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () {
                // Implementa la lógica para recordar al usuario
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 320,
                height: 320,
                color: Colors.white,
                child: Image.asset('assets/doramayer.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Dora Mayer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Dora Mayer fue una educadora apasionada y visionaria que dedicó su vida al servicio de la educación y el desarrollo de la juventud. Con una visión centrada en la excelencia académica y la formación integral de sus estudiantes, Dora Mayer fundó la Institución Educativa Dora Mayer con el objetivo de brindar una educación de calidad que inspire, motive y empodere a las generaciones futuras. '
                    'Nuestra institución, inspirada en los valores de integridad, excelencia y servicio, se esfuerza por proporcionar un ambiente de aprendizaje enriquecedor y estimulante donde cada estudiante pueda alcanzar su máximo potencial. '
                    'Con un enfoque en el desarrollo personal, académico y social, Dora Mayer ofrece una amplia gama de oportunidades educativas y extracurriculares que fomentan el crecimiento holístico de nuestros alumnos. '
                    'En Dora Mayer, nos comprometemos a cultivar líderes del mañana, ciudadanos responsables y agentes de cambio positivo en sus comunidades. '
                    'Con un equipo de educadores dedicados y un entorno de aprendizaje innovador, estamos preparando a nuestros estudiantes para enfrentar los desafíos del mundo moderno y hacer una diferencia significativa en el mundo que los rodea. '
                    'Únete a nosotros en nuestra misión de inspirar el aprendizaje, fomentar la excelencia y empoderar a cada estudiante para alcanzar sus sueños y aspiraciones más altas. '
                    'Juntos, estamos construyendo un futuro brillante para la próxima generación.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              // Agrega más información sobre Dora Mayer u otras cosas relevantes aquí
            ],
          ),
        ),
        drawer: NavDrawer(),
      ),
    );
  }
}
