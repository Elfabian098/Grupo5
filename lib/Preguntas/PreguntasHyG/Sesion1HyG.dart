import 'package:flutter/material.dart';
import 'package:guia5/Cursos/Historia%20y%20geografia.dart';
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
    1: 'b) George Washington',
    2: 'c) París',
    3: 'b) 1789'
    // Add correct answers for other questions here
  };

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
    });
  }

  // Method to handle user's answer selection
  void handleAnswer(int questionNumber, String answer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userAnswer_$questionNumber', answer);
    setState(() {
      userAnswers[questionNumber] = answer;
    });
  }

  // Method to verify answers
  void verifyAnswers() async {
    int correctCount = 0;
    userAnswers.forEach((questionNumber, userAnswer) {
      String correctAnswer = correctAnswers[questionNumber]!;
      if (userAnswer == correctAnswer) {
        correctCount++;
      }
    });

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

  // Check if all questions are answered
  bool areAllQuestionsAnswered() {
    return userAnswers.length == correctAnswers.length;
  }

  @override
  Widget build(BuildContext context) {
    // Questions and options
    List<Map<String, dynamic>> questions = [
      {
        'question': '¿Quién fue el primer presidente de Estados Unidos?',
        'options': ['a) Abraham Lincoln', 'b) George Washington', 'c) Thomas Jefferson', 'd) Benjamin Franklin']
      },
      {
        'question': '¿Cuál es la capital de Francia?',
        'options': ['a) Madrid', 'b) Roma', 'c) París', 'd) Londres']
      },
      {
        'question': '¿En qué año comenzó la Revolución Francesa?',
        'options': ['a) 1776', 'b) 1789', 'c) 1804', 'd) 1812']
      },
      // Add more questions and options here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas de la Sesión 1',
          style: TextStyle(color: Colors.white),),
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
                Text(
                  'Pregunta $questionNumber',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Establece el texto en negrita
                    fontSize: 22, // Tamaño de fuente opcional
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Establece el texto en negrita
                    fontSize: 18, // Tamaño de fuente opcional
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
      floatingActionButton: ElevatedButton(
        onPressed: areAllQuestionsAnswered() ? verifyAnswers : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFB90000), // Cambia el color de fondo del botón flotante a azul
        ),
        child: Text(
          'Verificar',
          style: TextStyle(color: Colors.white),
        ),
      ),

    );
  }
}
