import 'package:flutter/material.dart';
import 'package:guia5/ListaCursos.dart';

class His_Geo extends StatelessWidget {
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
class MyApp extends StatelessWidget {
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
        title: Text('Regresar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Utiliza Navigator.pop para regresar a la página anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: ContentArea(),
      ),
    );
  }
}


class ContentArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white, // Color de fondo agregado
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historia y Geografía',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.F1QTBKGrlpEGi4XhKPwfugHaGL?rs=1&pid=ImgDetMain',
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
            'En este curso de historia y geografía, explorarás desde las antiguas civilizaciones hasta los eventos contemporáneos, comprendiendo cómo moldearon nuestro presente. Analizarás batallas, líderes y revoluciones clave, y descubrirás las culturas perdidas en el tiempo. En historia, desenterrarás las raíces de nuestras sociedades y entenderás cómo han forjado nuestro camino hasta el presente. En geografía, viajarás por paisajes desde selvas tropicales hasta desiertos, comprendiendo cómo influyen en la historia humana. Analizarás la distribución de la población y cómo afecta a las dinámicas sociales, económicas y políticas. Desde metrópolis hasta aldeas, entenderás cómo la geografía impacta en nuestras vidas y relaciones.',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 16),
          Text(
            'Un resumen de su curso',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  TaskDetails(
                    title: '1',
                    description: 'Sesion(es) Aperturada(s)',
                  ),
                  SizedBox(width: 16),
                  TaskDetails(
                    title: '1',
                    description: 'Sesion(es) Actual(es)',
                  ),
                  SizedBox(width: 16),
                  TaskDetails(
                    title: '0',
                    description: 'Sesion(es) Completadas',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Sesiones después',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          ListView(
            shrinkWrap: true,
            children: [
              ListContainer(
                title: 'Sesión 01',
                description: '10 de mayo de 2024',
                date: 'Introducción al curso',
                isCompleted: true,
              ),
              ListContainer(
                title: 'Sesión 02',
                description: '15 de mayo de 2024',
                date: 'El mundo antiguo',
                isCompleted: true,
              ),
              ListContainer(
                title: 'Sesión 03',
                description: '20 de mayo de 2024',
                date: 'Exploración y descubrimientos',
                isCompleted: false,
              ),
              ListContainer(
                title: 'Sesión 04',
                description: '25 de mayo de 2024',
                date: 'La era de las revoluciones',
                isCompleted: false,
              ),
              ListContainer(
                title: 'Sesión 05',
                description: '30 de mayo de 2024',
                date: 'La Primera Guerra Mundial',
                isCompleted: false,
              ),
            ],
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
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
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

class ListContainer extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool isCompleted;

  ListContainer({required this.title, required this.description, required this.date, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white, // Color de fondo agregado
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline3,
              ),
              if (isCompleted)
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.green,
                  child: Text(
                    'REALIZADO',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            'Fecha: $date',
            style: Theme.of(context).textTheme.headline4,
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