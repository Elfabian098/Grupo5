import 'package:flutter/material.dart';
import 'package:guia5/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Cambié el widget MyAppSplash por LoginPage
    );
  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Arreglos unidimensionales paralelos para almacenar usuarios y claves
  final List<String> usuarios = ['giussepi@gmail.com', 'andre@gmail.com', 'gaa@gmail.com', 'hola@gmail.com'];
  final List<String> claves = ['1234', '4321', '4321', '4321'];

  // Controladores para los campos de texto
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Variables para mensajes de error
  String emailErrorText = '';
  String passwordErrorText = '';

  // Función para búsqueda secuencial
  bool buscarUsuario(String usuario, String clave) {
    for (int i = 0; i < usuarios.length; i++) {
      if (usuarios[i] == usuario && claves[i] == clave) {
        return true; // Usuario y clave encontrados
      }
    }
    return false; // Usuario y/o clave no encontrados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                errorText: emailErrorText.isNotEmpty ? emailErrorText : null,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                errorText: passwordErrorText.isNotEmpty ? passwordErrorText : null,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (email.isEmpty) {
                  setState(() {
                    emailErrorText = 'Por favor, introduce un correo electrónico.';
                  });
                } else {
                  setState(() {
                    emailErrorText = '';
                  });
                }

                if (password.isEmpty) {
                  setState(() {
                    passwordErrorText = 'Por favor, introduce una contraseña.';
                  });
                } else {
                  setState(() {
                    passwordErrorText = '';
                  });
                }

                if (email.isNotEmpty && password.isNotEmpty) {
                  // Buscar usuario y clave
                  if (buscarUsuario(email, password)) {
                    // Acceso concedido
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAppSplash()),
                    );
                  } else {
                    // Usuario y/o clave incorrectos
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Correo electrónico o contraseña incorrectos.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                }
              },
              child: Text('Iniciar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}


