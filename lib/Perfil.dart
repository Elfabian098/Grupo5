import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';

class Perfil extends StatelessWidget{
  const Perfil({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    Widget titleSection = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(
              padding:  const EdgeInsets.only(bottom: 3),
            ),
            Text( textAlign: TextAlign.center,
              'DR. PERVIS PAREDES\nDECANO DE LA FACULTAD DE INGENIERIA INDUSTRIAL Y DE SISTEMAS\n'
                  'Resolución R. N* 3389-2019-UNFV\n(+51) 748-0888 \nAnexo: 8740 \ndecanato.filis@unfv.edu.pe'
                  ,
              style: TextStyle(
                color: Colors.grey[500],
              ),
            )
            ],
          ),
          ),
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
          const Text('41'),
        ],
      )
    );

Color color= Colors.orange;

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color,Icons.call,'CALL'),
      _buildButtonColumn(color,Icons.near_me,'ROUTE'),
      _buildButtonColumn(color,Icons.contacts,'CONTACTO')
    ],
);

Widget textSection = const Padding(
  padding: EdgeInsets.all(32),
  child: Text(
    'Estimados nuevos estudiantes, les doy la bienvenida a todos ustedes, en esta nueva era'
        'le damos un saludo a todos ustedes y vamos a indicarles que la universidad es su casa'
        'ustedes son la razón de ser de la facultad y tendrán unos docentes de pimer nivel en la cual'
        'la enseñanza es profesional y con mucho cariño para ustedes xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        ,softWrap: true,
  )
);
return MaterialApp(
 title: 'Bienvenida del Decano FIIS',
 debugShowCheckedModeBanner: false,
 home: Scaffold(
    drawer: NavDrawer(),
appBar: AppBar(
title: const Text('Bienvenida del Decano FIIS'),
),
body: ListView(
children: [
  Image.asset('../assets/decano.jpg',width: 200,height: 340,fit: BoxFit.cover,
),
titleSection,
buttonSection,
textSection,
],
),
)
);

  }
  Column _buildButtonColumn(Color color, IconData icon, String label)
  { return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );

  }
}