import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:guia5/NavDrawer.dart';
import 'package:guia5/CambiarContraseña.dart';
import 'package:guia5/AjustesCuenta.dart';
import 'main.dart';


/*
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            home: PerfilWidget(),
          );
        },
      ),
    ),
  );
}
*/

class MyPerfilWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light(),
            home: PerfilWidget(),
          );
        },
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}

void setDarkModeSetting(BuildContext context, ThemeMode mode) {
  Provider.of<ThemeProvider>(context, listen: false).setTheme(mode);
}


class PerfilWidget extends StatefulWidget {
  const PerfilWidget({Key? key}) : super(key: key);

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}
class _PerfilWidgetState extends State<PerfilWidget> {
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('key1') ?? 'No hay datos';
    });
  }



  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).brightness == Brightness.light ?  Color(0xFFF1F4F8): Colors.black87,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
          automaticallyImplyLeading: true, // Deshabilitar el botón de retroceso automático,
          iconTheme: IconThemeData(
            size: 30, // Ajusta el tamaño del icono aquí
            color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
          ),
          /* leading: IconButton(
            iconSize: 32,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePage(title: '"Comunidad  I+E+Dora+Mayer"')));// Aquí puedes añadir la lógica para volver a la ventana anterior
               // Esto cierra la ventana actual y vuelve a la anterior
            },
          ),
            */
          flexibleSpace: FlexibleSpaceBar(
            title: Align(
              alignment: AlignmentDirectional(0, 1),
              child: Text(
                'Perfil - Dora Mayer',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                  fontSize: 36,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
            titlePadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
          ),
          elevation: 0,
        ),
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Theme.of(context).brightness == Brightness.light ? Color(0x3416202A) : Colors.black,
                      offset: Offset(
                        0.0,
                        0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.light ? Color(0x3416202A) : Color(0x34CED1DA), // Usar el color del tema para el borde
                    width: 2, //tamaño del borde
                  ),

                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/fotoperfil.webp',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Miguel Calderón-Favaro',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                fontSize: 24,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                              child: Text(
                                email ,
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),


          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0), //espaciado de arriba
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (Theme.of(context).brightness == Brightness.light)
                  TextButton(
                    onPressed: () {
                      setDarkModeSetting(context, ThemeMode.dark);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cambiar a Tema Oscuro',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                fontSize: 14,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.black ,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.95, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 8, 0),
                                      child: Icon(
                                        Icons.nights_stay,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.85, 0),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x430B0D0F),
                                            offset: Offset(
                                              0.0,
                                              2,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(30),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (Theme.of(context).brightness == Brightness.dark)
                  TextButton(
                    onPressed: () {
                      setDarkModeSetting(context, ThemeMode.light);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.circular(12),
                          shape: BoxShape.rectangle
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cambiar a Tema Claro',
                              style: TextStyle(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                                fontSize: 14,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: AlignmentDirectional(0, 0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.9, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 2, 0, 0),
                                      child: Icon(
                                        Icons.wb_sunny_rounded,
                                        color: Colors.black,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.9, 0),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: Colors.black, // COLOR DEL BOTÓN DE TEMA
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x430B0D0F),
                                            offset: Offset(
                                              0.0,
                                              2,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(30), // borde del botón de tema
                                        shape: BoxShape.rectangle, //no mover
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 12, 0, 12),
                        child: Text(
                          'Ajustes de la Cuenta',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black, // Usar color blanco en el tema claro y negro en el tema oscuro
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Theme.of(context).brightness == Brightness.light ? Color(0x3416202A) : Colors.black,
                        offset: Offset(
                          0.0,
                          0,
                        ),
                      )
                    ], //sombra del contenedor
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),

                          child: Text(
                            'Cambiar Contraseña',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, // Usar color negro en el tema claro y blanco en el tema oscuro
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.9, 0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push( context, MaterialPageRoute(builder: (context) => ChangePassword())); // Cambia a SplashScreen2 );
                              },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, // Usar color negro en el tema claro y blanco en el tema oscuro
                              size: 18,
                            ),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Theme.of(context).brightness == Brightness.light ? Color(0x3416202A) : Colors.black,
                        offset: Offset(
                          0.0,
                          0,
                        ),
                      )
                    ], //sombra del contenedor
                    borderRadius: BorderRadius.circular(12),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Text(
                            'Editar Perfil',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.9, 0),
                              child: GestureDetector(
                              onTap: () {
                              Navigator.push( context, MaterialPageRoute(builder: (context) => AjustesCuenta())); // Cambia a SplashScreen2 );
                              },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Botón Presionado...');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.transparent),
                          ),
                        ).copyWith(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black; // Color del botón cuando está deshabilitado
                              }
                              return Theme.of(context).brightness == Brightness.light ? Colors.white : Colors.black; // Color del botón cuando está habilitado
                            },
                          ),
                        ),
                      child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => LoginPage())); },
                        child: Text(
                          'Cerrar Sesión',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                            letterSpacing: 0,
                            color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, // Color del texto
                          ),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 158,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light ? Color(0x3416202A) : Colors.black54, // Usar el color del tema para el fondo
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/doramayer.jpg'),
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light ? Color(0x3416202A) : Colors.black54, // Usar el color del tema para el borde
                width: 10,
              ),
            ),
          )

        ],
      ),
      drawer: NavDrawer(),
    );
  }
}
