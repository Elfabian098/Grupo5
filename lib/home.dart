import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';
import 'package:fl_chart/fl_chart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF862A22), // Color de fondo general
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Contenedor de Bienvenido
              Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    // Título Bienvenido
                    Text(
                      'Bienvenido',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    SizedBox(height: 8.0),
                    // Descripción (opcional)
                    Text(
                      'Aquí podrás ver el avance de tus cursos',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    // Fila con íconos y textos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tareas
                        Row(
                          children: [
                            Icon(Icons.assignment, color: Colors.blue),
                            SizedBox(width: 4.0),
                            Text('Tareas'),
                          ],
                        ),
                        // Completadas
                        Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 4.0),
                            Text('Completadas'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    // Gráfico lineal
                    Container(
                      height: 200.0,
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: 6,
                          minY: 0,
                          maxY: 100,
                          titlesData: FlTitlesData(
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(color: Colors.black, fontSize: 14),
                              margin: 10,
                              reservedSize: 30,
                              interval: 20,
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return '0';
                                  case 50:
                                    return '50';
                                  case 100:
                                    return '100';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            bottomTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (value) => const TextStyle(color: Colors.black, fontSize: 14),
                              margin: 10,
                              reservedSize: 30,
                              interval: 1,
                              getTitles: (value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Día 1';
                                  case 1:
                                    return 'Día 2';
                                  case 2:
                                    return 'Día 3';
                                  case 3:
                                    return 'Día 4';
                                  case 4:
                                    return 'Día 5';
                                  case 5:
                                    return 'Día 6';
                                  case 6:
                                    return 'Día 7';
                                  default:
                                    return '';
                                }
                              },
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(color: Colors.black),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 80),
                                FlSpot(1, 60),
                                FlSpot(2, 40),
                                FlSpot(3, 70),
                                FlSpot(4, 50),
                                FlSpot(5, 90),
                                FlSpot(6, 30),
                              ],
                              isCurved: true,
                              colors: [Colors.blue],
                              barWidth: 4,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Contenedor de Tareas
              Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      'Tareas',
                      style: TextStyle(fontSize: 24.0),
                    ),
                    // Tarea 1
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Curso de Historia'),
                          SizedBox(height: 4.0),
                          Text(
                            'Seccion: Nombre',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            ' Vence el Fecha: 2024-05-13', // Reemplaza con la fecha actual
                            style: TextStyle(fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    // Tarea 2
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Curso de Matemáticas'),
                          SizedBox(height: 4.0),
                          Text(
                            'Seccion: Nombre',
                            style: TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Vence el Fecha: 2024-05-13', // Reemplaza con la fecha actual
                            style: TextStyle(fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    // Puedes agregar más contenedores de tareas aquí
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: NavDrawer(),
    );
  }
}
