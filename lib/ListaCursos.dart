import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';
import 'package:guia5/Cursos/Historia y geografia.dart';

class ListaCursos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Lista Cursos", style: TextStyle(color: Colors.white)),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
          child: Center(child: Column(
          children: [
             Container(
              color: Color(0xFF862A22), // Color de fondo para el contenedor externo
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            '../assets/arte_cultura.png',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arte y Cultura',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container( // Contenedor para el icono
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '../assets/comunicacion.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Comunicación',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container( // Contenedor para el icono
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '../assets/EPT.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'E. P. T.',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container( // Contenedor para el icono
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '../assets/historia.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Historia',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => His_Geo()),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_right_alt,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '../assets/ingles.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ingles.',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container( // Contenedor para el icono
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '../assets/matematica.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Matemáticas',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container( // Contenedor para el icono
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container( // Contenedor para la imagen
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            '../assets/quimica.jpg',
                            width: 120,
                            height: 120,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Química',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descripción del curso...',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container( // Contenedor para el icono
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_right_alt,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),),
      ),
    );
  }
}
