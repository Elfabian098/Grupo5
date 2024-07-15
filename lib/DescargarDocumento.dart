import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:guia5/NavDrawer.dart';


void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class DescargarDocumentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UrlLauncherPage(),
    );
  }
}

class UrlLauncherPage extends StatelessWidget {
  final String url = 'http://localhost:3000/public/document/25/oviedocode_helpdesk%20(4).sql';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abrir URL en Navegador'),
      ),
        drawer: NavDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchURL(url);
          },
          child: Text('Abrir Documento'),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}