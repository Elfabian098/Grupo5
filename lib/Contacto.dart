import 'package:flutter/material.dart';
import 'package:guia5/NavDrawer.dart';
import 'package:url_launcher/url_launcher.dart';


class Contacto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacto"),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Contáctanos",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              ListTile(
                leading: Icon(Icons.facebook),
                title: Text("Facebook"),
                subtitle: Text("DORA MAYER Página Oficial"),
                onTap: () async {
                  String url = "https://www.facebook.com/IEDoraMayerCallao?locale=es_LA";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'No se pudo abrir el enlace $url';
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.email),
                title: Text("Correo Electrónico"),
                subtitle: Text("mesadepartesdoramayer@gmail.com"),
                onTap: () async {
                  String url = "mesadepartesdoramayer@gmail.com";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'No se pudo abrir el enlace $url';
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.call),
                title: Text("Teléfono"),
                subtitle: Text("(01) 4521724"),
                onTap: () async {
                  String url = "(01) 4521724";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'No se pudo abrir el enlace $url';
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.web),
                title: Text("Página Web"),
                subtitle: Text("Bienvenidos a la Institución Educativa Dora Mayer"),
                onTap: () async {
                  String url = "https://doramayer.weebly.com/?fbclid=IwZXh0bgNhZW0CMTAAAR3j5kJC1XVgYLqLZuRTzBMChEubA9kHAPYMTg0AWqXpA4hqqBA24FwOM7g_aem_ZmFrZWR1bW15MTZieXRlcw";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'No se pudo abrir el enlace $url';
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.map),
                title: Text("Ubicación"),
                subtitle: Text("PARQUE LAS AMÉRICAS 140 URB. SAN JOSÉ - BELLAVISTA - CALLAO, Callao, Peru"),
                onTap: () async {
                  String url = "https://www.google.com/maps/place/Institución+Educativa+Dora+Mayer/@-12.0571576,-77.0934082,19.5z/data=!4m6!3m5!1s0x9105c91f25fc8157:0xed397d8e4327d9cd!8m2!3d-12.0570768!4d-77.0934733!16s%2Fg%2F11l6pgyb3f?entry=ttu";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'No se pudo abrir el enlace $url';
                  }
                },

              ),
              // Agrega más ListTile según sea necesario para otras redes sociales
            ],
          ),
        ),
      ),
    );
  }
}
