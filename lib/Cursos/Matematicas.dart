import 'package:flutter/material.dart';
import 'package:guia5/ListaCursos.dart';

class Mate extends StatelessWidget {
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
            'Matemática',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdivagancias.com%2F2018%2F04%2F02%2Fimportancia-del-arte-y-la-cultura%2F&psig=AOvVaw11KkPx76aCetvTXR7aJxTh&ust=1716838269459000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCOCN7IyHrIYDFQAAAAAdAAAAABAE',
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
            '-------------------------------------------------------------------------------------',
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
                date: '---------------',
                isCompleted: true,
              ),
              ListContainer(
                title: 'Sesión 03',
                description: '20 de mayo de 2024',
                date: '---------------',
                isCompleted: false,
              ),
              ListContainer(
                title: 'Sesión 04',
                description: '25 de mayo de 2024',
                date: '---------------',
                isCompleted: false,
              ),
              ListContainer(
                title: 'Sesión 05',
                description: '30 de mayo de 2024',
                date: '---------------',
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

