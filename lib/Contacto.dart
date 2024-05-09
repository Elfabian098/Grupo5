import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';

class Contacto extends StatelessWidget
{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      drawer: NavDrawer(),
      body: Center(child: Text("Esta es la página de contacto")),
    );
  }
}