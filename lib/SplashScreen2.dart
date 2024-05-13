import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guia5/home.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  late StreamController<String> _streamController;
  late Stream<String> _stream;
  late Timer _timer;
  String _dots = '';

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<String>();
    _stream = _streamController.stream;
    _timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      _streamController.sink.add(_dots);
      if (_dots.length < 3) {
        _dots += '.';
      } else {
        _dots = '';
      }
    });
    Timer(Duration(seconds: 6), () {
      // Navega a la pantalla de inicio después de 3 segundos
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Home')),
      );
    });
  }

  @override
  void dispose() {
    _streamController.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF580001), // Cambia el color de fondo a rojo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/doramayer2.jpg', // Ruta de la imagen en tu carpeta assets
              width: 500, // Ancho deseado de la imagen
              height: 500, // Alto deseado de la imagen
              // Ajusta el fit según tus necesidades
              // BoxFit.cover: la imagen se ajusta para cubrir el área de visualización
              // BoxFit.contain: la imagen se ajusta dentro del área de visualización
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20), // Espacio entre la imagen y el texto
            StreamBuilder<String>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Cargando${snapshot.data}',
                    style: TextStyle(
                      color: Colors.white, // Color de texto blanco
                      fontSize: 20, // Tamaño de texto
                      fontWeight: FontWeight.bold, // Fuente en negrita
                    ),
                  );
                } else {
                  return Container(); // O cualquier otro widget que desees mostrar
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
