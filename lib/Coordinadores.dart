import 'package:flutter/material.dart';

class CoordinadoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordinadores'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.school), text: 'Escenario 1'),
                Tab(icon: Icon(Icons.work), text: 'Escenario 2'),
                Tab(icon: Icon(Icons.group), text: 'Escenario 3'),
              ],
            ),
            title: Text('Demo'),
          ),
          body: TabBarView(
            children: [
              Escenario1(),
              Escenario2(),
              Escenario3(),
            ],
          ),
        ),
      ),
    );
  }
}

class Escenario1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('../assets/coordinador1.jpg'),
            radius: 60.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'Juan Pérez\nCoordinador de Educación\La formación académica recibida y mi desempeño profesional me han permitido construir un proyecto de vida caracterizado por la ética, la responsabilidad, el respeto a la diferencia, la cual conduce a un trato digno hacia los demás, poseo claridad conceptual y habilidades para la estructuración, administración de personal, el trabajo en equipo y el manejo de relaciones interpersonales. Tengo continuo interés por la actualización profesional.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class Escenario2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('../assets/coordinador2.jpg'),
            radius: 60.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'Mario Gonzales\nCoordinador de Proyectos\nLa formación académica recibida y mi desempeño profesional me han permitido construir un proyecto de vida caracterizado por la ética, la responsabilidad, el respeto a la diferencia, la cual conduce a un trato digno hacia los demás, poseo claridad conceptual y habilidades para la estructuración, administración de personal, el trabajo en equipo y el manejo de relaciones interpersonales. Tengo continuo interés por la actualización profesional.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class Escenario3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('../assets/coordinador3.jpg'),
            radius: 60.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'Pedro Martínez\nCoordinador de Eventos\nLa formación académica recibida y mi desempeño profesional me han permitido construir un proyecto de vida caracterizado por la ética, la responsabilidad, el respeto a la diferencia, la cual conduce a un trato digno hacia los demás, poseo claridad conceptual y habilidades para la estructuración, administración de personal, el trabajo en equipo y el manejo de relaciones interpersonales. Tengo continuo interés por la actualización profesional.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coordinadores Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoordinadoresPage(),
    );
  }
}

void main() {
  runApp(MyApp());
}
