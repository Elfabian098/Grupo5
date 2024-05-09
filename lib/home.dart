import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';
class MyHomePage extends StatefulWidget
{ const MyHomePage ({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState()=> _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget  build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Center(
        child: Container(
          width: 320,
          height: 320,
            color: Colors.white,
          child: Image.asset('../assets/ucv.jpg'),
        ),
      ),
      drawer: NavDrawer(),
    );
  }
}
