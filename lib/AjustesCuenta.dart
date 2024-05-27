
import 'package:flutter/material.dart';


class AjustesCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajustes de Cuenta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountSettingsPage(),
    );
  }
}

class AccountSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes de Cuenta'),
      ),
      body: AccountSettingsForm(),
    );
  }
}

class AccountSettingsForm extends StatefulWidget {
  @override
  _AccountSettingsFormState createState() => _AccountSettingsFormState();
}

class _AccountSettingsFormState extends State<AccountSettingsForm> {
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 20),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Guardando ajustes')),
                  );
                  // Aquí puedes agregar la lógica para guardar los ajustes en tu backend o en una base de datos local
                }
              },
              child: Text('Guardar Ajustes'),
            ),
          ],
        ),
      ),
    );
  }
}
