import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sesion1ArtCul extends StatefulWidget {
  @override
  _Sesion1HyGState createState() => _Sesion1HyGState();
}

class _Sesion1HyGState extends State<Sesion1ArtCul> {
  // Map to store user's answers for each question
  Map<int, String> userAnswers = {};

  // Map to store correct answers
  Map<int, String> correctAnswers = {
    1: 'a) Renacimiento',
    2: 'b) Siglo XX',
    3: 'c) Realismo',
    4: 'a) La Gioconda',
    5: 'd) Arquitectura',
    6: 'b) Teatro',
    7: 'c) Impresionismo',
    8: 'a) Surrealismo',
    9: 'd) El David',
    10: 'b) Siglo XIX',
    11: 'c) Modernismo',
    12: 'a) Pintura',
    13: 'd) Barroco',
    14: 'b) La noche estrellada',
    15: 'c) Romanticismo',
    16: 'd) Música',
    17: 'b) Literatura',
    18: 'a) Siglo XVIII',
    19: 'c) Pablo Picasso',
    20: 'd) Arte pop',
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
        'question': '¿Qué movimiento artístico surgió en Italia en el siglo XV y se caracteriza por el renacimiento del interés por la cultura clásica?',
        'options': ['a) Renacimiento', 'b) Barroco', 'c) Gótico', 'd) Modernismo']
      },
      {
        'question': '¿En qué siglo se desarrolló el movimiento artístico conocido como Expresionismo?',
        'options': ['a) Siglo XVIII', 'b) Siglo XX', 'c) Siglo XIX', 'd) Siglo XVI']
      },
      {
        'question': '¿Qué movimiento artístico se caracteriza por una representación fiel y objetiva de la realidad?',
        'options': ['a) Impresionismo', 'b) Surrealismo', 'c) Realismo', 'd) Cubismo']
      },
      {
        'question': '¿Cuál es la obra más famosa de Leonardo da Vinci?',
        'options': ['a) La Gioconda', 'b) La última cena', 'c) Hombre de Vitruvio', 'd) La Anunciación']
      },
      {
        'question': '¿Qué disciplina artística se dedica al diseño y construcción de edificios?',
        'options': ['a) Escultura', 'b) Pintura', 'c) Danza', 'd) Arquitectura']
      },
      {
        'question': '¿Cuál de las siguientes es una forma de arte escénico que combina actuación, canto y baile?',
        'options': ['a) Pintura', 'b) Teatro', 'c) Escultura', 'd) Arquitectura']
      },
      {
        'question': '¿Qué movimiento artístico del siglo XIX se caracteriza por su interés en capturar la luz y el color en sus obras?',
        'options': ['a) Realismo', 'b) Surrealismo', 'c) Impresionismo', 'd) Cubismo']
      },
      {
        'question': '¿Qué movimiento artístico se caracteriza por la representación de escenas oníricas y abstractas?',
        'options': ['a) Surrealismo', 'b) Realismo', 'c) Impresionismo', 'd) Cubismo']
      },
      {
        'question': '¿Cuál es una famosa escultura de Miguel Ángel?',
        'options': ['a) La Piedad', 'b) Moisés', 'c) San Mateo', 'd) El David']
      },
      {
        'question': '¿En qué siglo se desarrolló el movimiento artístico conocido como Modernismo?',
        'options': ['a) Siglo XVIII', 'b) Siglo XIX', 'c) Siglo XVII', 'd) Siglo XX']
      },
      {
        'question': '¿Qué movimiento artístico se caracteriza por la utilización de formas geométricas y colores vivos?',
        'options': ['a) Renacimiento', 'b) Barroco', 'c) Modernismo', 'd) Gótico']
      },
      {
        'question': '¿Qué disciplina artística utiliza colores y pinceles para crear imágenes sobre lienzo o papel?',
        'options': ['a) Pintura', 'b) Escultura', 'c) Danza', 'd) Arquitectura']
      },
      {
        'question': '¿Qué movimiento artístico del siglo XVII se caracteriza por el uso de contrastes dramáticos de luz y sombra?',
        'options': ['a) Renacimiento', 'b) Gótico', 'c) Modernismo', 'd) Barroco']
      },
      {
        'question': '¿Cuál es una famosa pintura de Vincent van Gogh?',
        'options': ['a) La Gioconda', 'b) La noche estrellada', 'c) El nacimiento de Venus', 'd) El jardín de las delicias']
      },
      {
        'question': '¿Qué movimiento artístico se desarrolló en el siglo XVIII y se caracteriza por su énfasis en la emoción y la individualidad?',
        'options': ['a) Barroco', 'b) Renacimiento', 'c) Romanticismo', 'd) Modernismo']
      },
      {
        'question': '¿Qué disciplina artística se dedica a la creación y combinación de sonidos?',
        'options': ['a) Pintura', 'b) Escultura', 'c) Danza', 'd) Música']
      },
      {
        'question': '¿Qué disciplina artística se dedica a la creación de obras literarias?',
        'options': ['a) Pintura', 'b) Literatura', 'c) Escultura', 'd) Música']
      },
      {
        'question': '¿En qué siglo se desarrolló el movimiento artístico conocido como Neoclasicismo?',
        'options': ['a) Siglo XVIII', 'b) Siglo XVII', 'c) Siglo XVI', 'd) Siglo XIX']
      },
      {
        'question': '¿Qué artista es conocido por sus pinturas cubistas?',
        'options': ['a) Salvador Dalí', 'b) Vincent van Gogh', 'c) Pablo Picasso', 'd) Leonardo da Vinci']
      },
      {
        'question': '¿Qué movimiento artístico del siglo XX se caracteriza por el uso de imágenes de la cultura popular y los medios de comunicación?',
        'options': ['a) Surrealismo', 'b) Expresionismo', 'c) Cubismo', 'd) Arte pop']
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
