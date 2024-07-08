import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sesion5EPT extends StatefulWidget {
  @override
  _Sesion1EPTState createState() => _Sesion1EPTState();
}

class _Sesion1EPTState extends State<Sesion5EPT> {
  // Map to store user's answers for each question
  Map<int, String> userAnswers = {};

  // Map to store correct answers
  Map<int, String> correctAnswers = {
    1: 'a) Trabajo en equipo',
    2: 'b) Responsabilidad',
    3: 'c) Emprendimiento',
    4: 'a) Comunicación efectiva',
    5: 'd) Liderazgo',
    6: 'b) Toma de decisiones',
    7: 'c) Adaptabilidad',
    8: 'a) Puntualidad',
    9: 'd) Trabajo bajo presión',
    10: 'b) Innovación',
    11: 'c) Motivación',
    12: 'a) Habilidades técnicas',
    13: 'd) Gestión del tiempo',
    14: 'b) Resolución de conflictos',
    15: 'c) Ética profesional',
    16: 'd) Planificación',
    17: 'b) Productividad',
    18: 'a) Capacidad de aprendizaje',
    19: 'c) Negociación',
    20: 'd) Orientación a resultados',
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
        'question': '¿Cuál de las siguientes es una habilidad esencial para trabajar efectivamente en equipo?',
        'options': ['a) Trabajo en equipo', 'b) Independencia', 'c) Introversión', 'd) Autoridad']
      },
      {
        'question': '¿Qué cualidad es fundamental para un empleado responsable?',
        'options': ['a) Impuntualidad', 'b) Responsabilidad', 'c) Desorden', 'd) Desinterés']
      },
      {
        'question': '¿Qué capacidad es crucial para iniciar y gestionar un negocio propio?',
        'options': ['a) Conformismo', 'b) Inactividad', 'c) Emprendimiento', 'd) Desempeño']
      },
      {
        'question': '¿Cuál de las siguientes es una habilidad clave para una comunicación efectiva en el trabajo?',
        'options': ['a) Comunicación efectiva', 'b) Silencio', 'c) Monólogo', 'd) Confusión']
      },
      {
        'question': '¿Qué característica es esencial para alguien en una posición de liderazgo?',
        'options': ['a) Seguimiento', 'b) Pasividad', 'c) Desinterés', 'd) Liderazgo']
      },
      {
        'question': '¿Cuál es una habilidad importante para tomar decisiones informadas en el lugar de trabajo?',
        'options': ['a) Indecisión', 'b) Toma de decisiones', 'c) Duda', 'd) Vacilación']
      },
      {
        'question': '¿Qué cualidad permite a un empleado ajustarse a cambios en el ambiente de trabajo?',
        'options': ['a) Rigidez', 'b) Resistencia', 'c) Adaptabilidad', 'd) Inflexibilidad']
      },
      {
        'question': '¿Qué característica es importante para cumplir con los plazos y horarios en el trabajo?',
        'options': ['a) Puntualidad', 'b) Tardanza', 'c) Impuntualidad', 'd) Retraso']
      },
      {
        'question': '¿Cuál es una habilidad valiosa para manejar situaciones de alta presión en el trabajo?',
        'options': ['a) Evasión', 'b) Nerviosismo', 'c) Temor', 'd) Trabajo bajo presión']
      },
      {
        'question': '¿Qué cualidad es crucial para fomentar nuevas ideas y mejoras en el lugar de trabajo?',
        'options': ['a) Estancamiento', 'b) Innovación', 'c) Conformismo', 'd) Monotonía']
      },
      {
        'question': '¿Qué característica es fundamental para mantener la energía y la determinación en el trabajo?',
        'options': ['a) Desánimo', 'b) Desmotivación', 'c) Motivación', 'd) Fatiga']
      },
      {
        'question': '¿Qué tipo de habilidades son esenciales para realizar tareas específicas en un trabajo?',
        'options': ['a) Habilidades técnicas', 'b) Habilidades blandas', 'c) Habilidades sociales', 'd) Habilidades emocionales']
      },
      {
        'question': '¿Cuál es una habilidad importante para organizar y priorizar tareas en el trabajo?',
        'options': ['a) Desorden', 'b) Desorganización', 'c) Caos', 'd) Gestión del tiempo']
      },
      {
        'question': '¿Qué habilidad es esencial para resolver disputas y mantener la armonía en el lugar de trabajo?',
        'options': ['a) Ignorar conflictos', 'b) Resolver conflictos', 'c) Provocar conflictos', 'd) Evitar conflictos']
      },
      {
        'question': '¿Qué valor profesional implica actuar con integridad y responsabilidad en el trabajo?',
        'options': ['a) Deshonestidad', 'b) Irresponsabilidad', 'c) Ética profesional', 'd) Inmoralidad']
      },
      {
        'question': '¿Qué habilidad es esencial para establecer objetivos y determinar las acciones necesarias para lograrlos?',
        'options': ['a) Desorganización', 'b) Impulsividad', 'c) Improvisación', 'd) Planificación']
      },
      {
        'question': '¿Qué cualidad es crucial para aumentar la eficiencia y efectividad en el trabajo?',
        'options': ['a) Inactividad', 'b) Productividad', 'c) Procrastinación', 'd) Ineficiencia']
      },
      {
        'question': '¿Qué capacidad es esencial para adquirir nuevos conocimientos y habilidades en el trabajo?',
        'options': ['a) Capacidad de aprendizaje', 'b) Resistencia al cambio', 'c) Desinterés', 'd) Conformismo']
      },
      {
        'question': '¿Qué habilidad es crucial para llegar a acuerdos beneficiosos en el ámbito laboral?',
        'options': ['a) Imposición', 'b) Autoritarismo', 'c) Negociación', 'd) Subordinación']
      },
      {
        'question': '¿Qué orientación es fundamental para lograr metas y objetivos en el trabajo?',
        'options': ['a) Orientación al proceso', 'b) Orientación al esfuerzo', 'c) Orientación a la tarea', 'd) Orientación a resultados']
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
