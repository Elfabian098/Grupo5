import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sesion1HyG extends StatefulWidget {
  @override
  _Sesion1HyGState createState() => _Sesion1HyGState();
}

class _Sesion1HyGState extends State<Sesion1HyG> {
  // Map to store user's answers for each question
  Map<int, String> userAnswers = {};

  // Map to store correct answers
  Map<int, String> correctAnswers = {
    1: 'b) 1821',
    2: 'c) José de la Riva-Agüero',
    3: 'c) Inca',
    4: 'b) Francisco Pizarro',
    5: 'd) Cusco',
    6: 'b) Atahualpa',
    7: 'b) Moche',
    8: 'c) 1824',
    9: 'd) Tiahuanaco',
    10: 'b) Machu Picchu',
    11: 'b) Nazca',
    12: 'b) Tupac Amaru II',
    13: 'a) Amazonas',
    14: 'c) Lima',
    15: 'a) Paracas',
    16: 'a) Tupac Amaru I',
    17: 'a) Ramón Castilla',
    18: 'd) Tiahuanaco',
    19: 'd) Argentina',
    20: 'b) 1854',
  };

  int correctCount = 0;

  @override
  void initState() {
    super.initState();
    loadUserAnswers();
  }

  // Method to load user's answers from shared preferences
  void loadUserAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 1; i <= correctAnswers.length; i++) {
        String? userAnswer = prefs.getString('userAnswer_$i');
        if (userAnswer != null) {
          userAnswers[i] = userAnswer;
        }
      }
      correctCount = calculateCorrectAnswers();
    });
  }

  // Method to handle user's answer selection
  void handleAnswer(int questionNumber, String answer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userAnswer_$questionNumber', answer);
    setState(() {
      userAnswers[questionNumber] = answer;
      correctCount = calculateCorrectAnswers();
    });
  }

  // Method to calculate the number of correct answers
  int calculateCorrectAnswers() {
    int count = 0;
    userAnswers.forEach((questionNumber, userAnswer) {
      String correctAnswer = correctAnswers[questionNumber]!;
      if (userAnswer == correctAnswer) {
        count++;
      }
    });
    return count;
  }

  // Method to verify answers
  void verifyAnswers() async {
    // Save session as completed
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sesion1Completed', true);

    // Show dialog with result
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultados'),
          content: Text('Respuestas correctas: $correctCount de ${correctAnswers.length}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  // Method to reset answers
  void resetAnswers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userAnswers.clear();
      for (int i = 1; i <= correctAnswers.length; i++) {
        prefs.remove('userAnswer_$i');
      }
      prefs.remove('sesion1Completed'); // Remove session completion status
      correctCount = 0;
    });
  }

  // Check if all questions are answered
  bool areAllQuestionsAnswered() {
    return userAnswers.length == correctAnswers.length;
  }

  @override
  Widget build(BuildContext context) {
    // Questions and options
    List<Map<String, dynamic>> questions = [
      {
        'question': '¿En qué año se proclamó la independencia del Perú?',
        'options': ['a) 1810', 'b) 1821', 'c) 1824', 'd) 1830']
      },
      {
        'question': '¿Quién fue el primer presidente del Perú?',
        'options': ['a) Ramón Castilla', 'b) Simón Bolívar', 'c) José de la Riva-Agüero', 'd) José de San Martín']
      },
      {
        'question': '¿Cuál es la civilización precolombina más conocida de Perú?',
        'options': ['a) Maya', 'b) Azteca', 'c) Inca', 'd) Moche']
      },
      {
        'question': '¿Qué conquistador español llegó al Perú en 1532?',
        'options': ['a) Hernán Cortés', 'b) Francisco Pizarro', 'c) Pedro de Alvarado', 'd) Diego de Almagro']
      },
      {
        'question': '¿Cuál fue la capital del Imperio Inca?',
        'options': ['a) Quito', 'b) Lima', 'c) La Paz', 'd) Cusco']
      },
      {
        'question': '¿Quién fue el último emperador inca?',
        'options': ['a) Huayna Cápac', 'b) Atahualpa', 'c) Tupac Amaru', 'd) Manco Inca']
      },
      {
        'question': '¿Cuál de las siguientes culturas preincaicas se desarrolló en la costa norte del Perú?',
        'options': ['a) Paracas', 'b) Moche', 'c) Nazca', 'd) Chavín']
      },
      {
        'question': '¿En qué año se produjo la Batalla de Ayacucho?',
        'options': ['a) 1821', 'b) 1822', 'c) 1824', 'd) 1826']
      },
      {
        'question': '¿Qué civilización precolombina se desarrolló en la región de Tiahuanaco?',
        'options': ['a) Inca', 'b) Moche', 'c) Nazca', 'd) Tiahuanaco']
      },
      {
        'question': '¿Cuál es la estructura arquitectónica más conocida de los incas?',
        'options': ['a) Tikal', 'b) Machu Picchu', 'c) Teotihuacan', 'd) Chichén Itzá']
      },
      {
        'question': '¿Qué cultura preincaica es conocida por sus líneas y geoglifos en el desierto?',
        'options': ['a) Moche', 'b) Nazca', 'c) Paracas', 'd) Chavín']
      },
      {
        'question': '¿Qué líder indígena encabezó una rebelión contra los españoles en 1780?',
        'options': ['a) Manco Inca', 'b) Tupac Amaru II', 'c) Atahualpa', 'd) Huáscar']
      },
      {
        'question': '¿Cuál es el río más largo de Perú?',
        'options': ['a) Amazonas', 'b) Ucayali', 'c) Marañón', 'd) Urubamba']
      },
      {
        'question': '¿Qué ciudad fue fundada por Francisco Pizarro en 1535?',
        'options': ['a) Cusco', 'b) Arequipa', 'c) Lima', 'd) Trujillo']
      },
      {
        'question': '¿Qué cultura preincaica es conocida por sus textiles finos y complejos?',
        'options': ['a) Paracas', 'b) Moche', 'c) Nazca', 'd) Chavín']
      },
      {
        'question': '¿Qué líder indígena fue decapitado por los españoles en 1572?',
        'options': ['a) Tupac Amaru I', 'b) Tupac Amaru II', 'c) Atahualpa', 'd) Manco Inca']
      },
      {
        'question': '¿Qué presidente peruano abolió la esclavitud en 1854?',
        'options': ['a) Ramón Castilla', 'b) Simón Bolívar', 'c) José de San Martín', 'd) Manuel Pardo']
      },
      {
        'question': '¿Qué civilización precolombina se destacó en la región del altiplano andino?',
        'options': ['a) Inca', 'b) Moche', 'c) Nazca', 'd) Tiahuanaco']
      },
      {
        'question': '¿Qué país no comparte frontera con Perú?',
        'options': ['a) Chile', 'b) Ecuador', 'c) Colombia', 'd) Argentina']
      },
      {
        'question': '¿En qué año se abolió la esclavitud en el Perú?',
        'options': ['a) 1821', 'b) 1854', 'c) 1866', 'd) 1879']
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tareas de la Sesión 1',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF580001),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Return the user's answers to the previous screen
            Navigator.pop(context, true);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            int questionNumber = index + 1;
            String question = questions[index]['question'];
            List<String> options = List<String>.from(questions[index]['options'] as List<dynamic>);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pregunta $questionNumber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Establece el texto en negrita
                        fontSize: 22, // Tamaño de fuente opcional
                        color: Colors.red,
                      ),
                    ),
                    if (questionNumber == 1)
                      Text(
                        'Nota: $correctCount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Establece el texto en negrita
                          fontSize: 22, // Tamaño de fuente opcional
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Establece el texto en negrita
                    fontSize: 18, // Tamaño de fuente opcional
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                // Display options as radio buttons
                ...options.map((option) {
                  return RadioListTile<String>(
                    title: Text(
                      option,
                      style: TextStyle(
                        fontFamily: 'Roboto', // Cambia la fuente a Roboto
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal, // Asegura que no haya cursiva
                      ),
                    ),
                    value: option,
                    groupValue: userAnswers[questionNumber],
                    activeColor: Colors.blue,
                    onChanged: (String? value) {
                      handleAnswer(questionNumber, value!);
                    },
                  );
                }).toList(),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: resetAnswers,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB90000), // Color del botón de reiniciar
            ),
            child: Text(
              'Reiniciar',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 8), // Espacio entre los dos botones
          ElevatedButton(
            onPressed: areAllQuestionsAnswered() ? verifyAnswers : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB90000), // Cambia el color de fondo del botón de verificar a rojo
            ),
            child: Text(
              'Verificar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
