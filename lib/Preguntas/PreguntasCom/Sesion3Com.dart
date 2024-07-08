import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sesion3Com extends StatefulWidget {
  @override
  _Sesion1HyGState createState() => _Sesion1HyGState();
}

class _Sesion1HyGState extends State<Sesion3Com> {
  // Map to store user's answers for each question
  Map<int, String> userAnswers = {};

  // Map to store correct answers
  Map<int, String> correctAnswers = {
    1: 'a) Emisor',
    2: 'd) Ruido',
    3: 'b) Código',
    4: 'a) Lenguaje verbal',
    5: 'c) Kinésica',
    6: 'd) Canal',
    7: 'b) Retroalimentación',
    8: 'a) Emotiva',
    9: 'c) Redundancia',
    10: 'd) Proxémica',
    11: 'b) Canal visual',
    12: 'a) Contexto',
    13: 'c) Interferencia semántica',
    14: 'a) Lenguaje no verbal',
    15: 'd) Entonación',
    16: 'b) Lenguaje corporal',
    17: 'c) Proxémica',
    18: 'a) Emisor',
    19: 'b) Mensaje',
    20: 'c) Contexto físico',
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
        'question': '¿Quién es el responsable de enviar el mensaje en el proceso de comunicación?',
        'options': ['a) Emisor', 'b) Receptor', 'c) Código', 'd) Canal']
      },
      {
        'question': '¿Qué elemento puede interferir y distorsionar el mensaje durante la comunicación?',
        'options': ['a) Contexto', 'b) Emisor', 'c) Código', 'd) Ruido']
      },
      {
        'question': '¿Cómo se llama el conjunto de signos que el emisor utiliza para transmitir el mensaje?',
        'options': ['a) Canal', 'b) Código', 'c) Contexto', 'd) Ruido']
      },
      {
        'question': '¿Cuál de los siguientes es un ejemplo de lenguaje verbal?',
        'options': ['a) Lenguaje verbal', 'b) Gestos', 'c) Posturas', 'd) Expresiones faciales']
      },
      {
        'question': '¿Qué tipo de comunicación no verbal implica el uso de movimientos del cuerpo?',
        'options': ['a) Proxémica', 'b) Paralingüística', 'c) Kinésica', 'd) Artefactos']
      },
      {
        'question': '¿Cuál es el medio físico por el que se transmite el mensaje?',
        'options': ['a) Emisor', 'b) Código', 'c) Contexto', 'd) Canal']
      },
      {
        'question': '¿Qué término se utiliza para describir la respuesta del receptor al mensaje del emisor?',
        'options': ['a) Ruido', 'b) Retroalimentación', 'c) Contexto', 'd) Canal']
      },
      {
        'question': '¿Qué función del lenguaje expresa los sentimientos y emociones del emisor?',
        'options': ['a) Emotiva', 'b) Referencial', 'c) Apelativa', 'd) Metalingüística']
      },
      {
        'question': '¿Cuál de los siguientes términos se refiere a la repetición innecesaria de información en la comunicación?',
        'options': ['a) Ruido', 'b) Redundancia', 'c) Interferencia', 'd) Canal']
      },
      {
        'question': '¿Qué tipo de comunicación no verbal se refiere al uso del espacio personal?',
        'options': ['a) Paralingüística', 'b) Kinésica', 'c) Artefactos', 'd) Proxémica']
      },
      {
        'question': '¿Qué canal utiliza principalmente la vista para transmitir mensajes?',
        'options': ['a) Canal auditivo', 'b) Canal visual', 'c) Canal táctil', 'd) Canal olfativo']
      },
      {
        'question': '¿Qué elemento del proceso de comunicación se refiere al entorno y las circunstancias en las que ocurre la comunicación?',
        'options': ['a) Contexto', 'b) Código', 'c) Emisor', 'd) Canal']
      },
      {
        'question': '¿Cuál de los siguientes se considera un tipo de interferencia que afecta el significado del mensaje?',
        'options': ['a) Ruido físico', 'b) Ruido psicológico', 'c) Interferencia semántica', 'd) Interferencia técnica']
      },
      {
        'question': '¿Qué tipo de comunicación se refiere al uso de gestos, posturas y expresiones faciales?',
        'options': ['a) Lenguaje no verbal', 'b) Lenguaje verbal', 'c) Lenguaje escrito', 'd) Lenguaje paraverbal']
      },
      {
        'question': '¿Qué aspecto del lenguaje paraverbal se refiere al tono y la modulación de la voz?',
        'options': ['a) Volumen', 'b) Velocidad', 'c) Timbre', 'd) Entonación']
      },
      {
        'question': '¿Cuál de los siguientes es un ejemplo de comunicación no verbal?',
        'options': ['a) Hablar', 'b) Lenguaje corporal', 'c) Escribir', 'd) Leer']
      },
      {
        'question': '¿Qué tipo de comunicación no verbal se refiere al uso del espacio y la distancia entre las personas?',
        'options': ['a) Paralingüística', 'b) Kinésica', 'c) Proxémica', 'd) Artefactos']
      },
      {
        'question': '¿Quién es la persona que inicia el proceso de comunicación?',
        'options': ['a) Emisor', 'b) Receptor', 'c) Canal', 'd) Contexto']
      },
      {
        'question': '¿Qué elemento del proceso de comunicación se refiere a la información que se transmite?',
        'options': ['a) Emisor', 'b) Mensaje', 'c) Canal', 'd) Código']
      },
      {
        'question': '¿Cuál de los siguientes se refiere al entorno físico donde ocurre la comunicación?',
        'options': ['a) Contexto social', 'b) Contexto cultural', 'c) Contexto físico', 'd) Contexto psicológico']
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
