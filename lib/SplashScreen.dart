
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guia5/home.dart';
import 'package:guia5/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Navega a la pantalla de inicio de sesión después de 3 segundos
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cambia el color de fondo según tu diseño
      body: Center(
        child: Image.asset(
          '../assets/doramayer.jpg', // Ruta de la imagen en tu carpeta assets
          width: 500, // Ancho deseado de la imagen
          height: 500, // Alto deseado de la imagen
          // Ajusta el fit según tus necesidades
          // BoxFit.cover: la imagen se ajusta para cubrir el área de visualización
          // BoxFit.contain: la imagen se ajusta dentro del área de visualización
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}