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
                child: Image.asset('assets/dora.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                '----------------------------------',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Biografía de Dora Mayer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA80001),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Vida Temprana',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF131313),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Dora Mayer nació en Hamburgo, Alemania, el 12 de mayo de 1868. Emigró al Perú con su familia cuando era niña, estableciéndose en el Callao.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Activismo Social',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      color: Color(0xFF131313),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Mayer fue una destacada educadora, periodista y defensora de los derechos humanos, especialmente de los pueblos indígenas. Trabajó incansablemente por la igualdad y la justicia social.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Contribuciones a la Educación',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                      color: Color(0xFF131313),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Dora Mayer hizo importantes contribuciones al campo de la educación en el Perú, promoviendo una educación inclusiva y de calidad para todos los sectores de la sociedad.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Legado y Reconocimientos',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF131313),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'El Colegio Dora Mayer, ubicado en Bellavista, Callao, lleva su nombre en honor a su legado. Su influencia en la promoción de los derechos humanos y la educación perdura hasta el día de hoy.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
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
