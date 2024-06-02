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
    prefs.setString('userAnswer_$questionNumber', answer);
    setState(() {
      userAnswers[questionNumber] = answer;
    });
  }

  // Method to verify answers
  void verifyAnswers() {
    int correctCount = 0;
    userAnswers.forEach((questionNumber, userAnswer) {
      String correctAnswer = correctAnswers[questionNumber]!;
      if (userAnswer == correctAnswer) {
        correctCount++;
      }
    });

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
        'options': [
          'a) 1776', 'b) 1789', 'c) 1804', 'd) 1812'],

      },

      // Add more questions and options here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tareas de la Sesión 1'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Return the user's answers to the previous screen
            Navigator.pop(context, userAnswers);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            int questionNumber = index + 1;
            String question = questions[index]['question']!;
            List<String> options = List<String>.from(questions[index]['options'] as List<dynamic>);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tarea $questionNumber',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 8),
                Text(
                  question,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 8),
                // Display options as radio buttons
                ...options.map((option) {
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: userAnswers[questionNumber],
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: verifyAnswers,
        label: Text('Verificar'),
        icon: Icon(Icons.check),
      ),
    );
  }
}
