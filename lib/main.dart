import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SplashScreen2.dart'; // Asegúrate de que este import sea correcto

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DORA MAYER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Cambia el home a LoginPage
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailAddressTextController;
  late TextEditingController _passwordTextController;
  late bool _passwordVisibility;

  // Arreglos unidimensionales paralelos para almacenar usuarios y claves
  final List<String> usuarios = ['giussepi@gmail.com', 'calderon@gmail.com', 'oviedo@gmail.com', 'hola@gmail.com'];
  final List<String> claves = ['1234', '4321', '1234', '4321'];

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

  // Función para guardar el email del usuario
  Future<void> _guardarDato1(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("key1", email);
  }

  @override
  void initState() {
    super.initState();
    _emailAddressTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _passwordVisibility = false;
  }

  @override
  void dispose() {
    _emailAddressTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB71D12), Color(0xFFB94037)],
            stops: [0, 1],
            begin: AlignmentDirectional(0.87, -1),
            end: AlignmentDirectional(-0.87, 1),
          ),
        ),
        alignment: AlignmentDirectional(0, -1),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                child: Container(
                  width: 320,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'I. E. DORA MAYER',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 36,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 570,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF222222),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '¡Bienvenido de vuelta!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFFE7EDF1),
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                            child: Text(
                              'Complete la información a continuación para acceder a su cuenta.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Color(0xFFE7EDF1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _emailAddressTextController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: 'Correo',
                                  labelStyle: TextStyle(color: Colors.white), // Cambio del color del texto de la etiqueta a blanco
                                  fillColor: Color(0xFF222222),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white), // Borde blanco
                                  ),
                                  enabledBorder: OutlineInputBorder( // Borde blanco cuando está habilitado
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder( // Borde blanco cuando está enfocado
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorText: emailErrorText.isNotEmpty ? emailErrorText : null,
                                  errorStyle: TextStyle(color: Colors.red), // Cambio del color del texto de error a blanco
                                ),
                                style: TextStyle(color: Colors.white), // Cambio del color del texto de entrada a blanco
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Container(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _passwordTextController,
                                obscureText: !_passwordVisibility,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  labelStyle: TextStyle(color: Colors.white), // Cambio del color del texto de la etiqueta a blanco
                                  fillColor: Color(0xFF222222),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white), // Borde blanco
                                  ),
                                  enabledBorder: OutlineInputBorder( // Borde blanco cuando está habilitado
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder( // Borde blanco cuando está enfocado
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  errorText: passwordErrorText.isNotEmpty ? passwordErrorText : null,
                                  errorStyle: TextStyle(color: Colors.red), // Cambio del color del texto de error a rojo
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisibility = !_passwordVisibility;
                                      });
                                    },
                                    icon: Icon(_passwordVisibility ? Icons.visibility : Icons.visibility_off),
                                    color: Colors.white, // Cambio del color del ícono a blanco
                                  ),
                                ),
                                style: TextStyle(color: Colors.white), // Cambio del color del texto de entrada a blanco
                              ),
                            ),
                          ),


                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: ElevatedButton(
                              onPressed: () async {
                                String email = _emailAddressTextController.text.trim();
                                String password = _passwordTextController.text.trim();

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
                                    // Guardar el nombre del usuario o el correo
                                    await _guardarDato1(email);

                                    // Aquí puedes agregar la navegación a la siguiente pantalla
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SplashScreen2()), // Cambia a SplashScreen2
                                    );
                                    // Acceso concedido
                                    print('Acceso concedido');
                                  } else {
                                    // Usuario y/o clave incorrectos
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog( backgroundColor: Colors.grey,
                                        title: Text('Error'),
                                        content: Text('Correo electrónico o contraseña incorrectos.' ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: Text('OK', style: TextStyle(color: Colors.red),),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(
                                    0xFFB71D12)), // Color de fondo del botón
                                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                                elevation: MaterialStateProperty.all<double>(3),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 44,
                                alignment: Alignment.center,
                                child: Text(
                                  'INICIA SESIÓN',
                                  style: TextStyle(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

