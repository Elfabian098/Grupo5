import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sesion4Eng extends StatefulWidget {
  @override
  _Session1EPTState createState() => _Session1EPTState();
}

class _Session1EPTState extends State<Sesion4Eng> {
  // Map to store user's answers for each question
  Map<int, String> userAnswers = {};

  // Map to store correct answers
  Map<int, String> correctAnswers = {
    1: 'a) Teamwork',
    2: 'b) Responsibility',
    3: 'c) Entrepreneurship',
    4: 'a) Effective communication',
    5: 'd) Leadership',
    6: 'b) Decision-making',
    7: 'c) Adaptability',
    8: 'a) Punctuality',
    9: 'd) Working under pressure',
    10: 'b) Innovation',
    11: 'c) Motivation',
    12: 'a) Technical skills',
    13: 'd) Time management',
    14: 'b) Conflict resolution',
    15: 'c) Professional ethics',
    16: 'd) Planning',
    17: 'b) Productivity',
    18: 'a) Learning capability',
    19: 'c) Negotiation',
    20: 'd) Results orientation',
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
    await prefs.setBool('session1Completed', true);

    // Show dialog with result
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Results'),
          content: Text('Correct answers: $correctCount out of ${correctAnswers.length}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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
      prefs.remove('session1Completed'); // Remove session completion status
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
        'question': 'Which of the following is an essential skill for effective teamwork?',
        'options': ['a) Teamwork', 'b) Independence', 'c) Introversion', 'd) Authority']
      },
      {
        'question': 'What quality is fundamental for a responsible employee?',
        'options': ['a) Impunctuality', 'b) Responsibility', 'c) Disorder', 'd) Disinterest']
      },
      {
        'question': 'Which ability is crucial for starting and managing your own business?',
        'options': ['a) Conformity', 'b) Inactivity', 'c) Entrepreneurship', 'd) Performance']
      },
      {
        'question': 'Which of the following is a key skill for effective communication at work?',
        'options': ['a) Effective communication', 'b) Silence', 'c) Monologue', 'd) Confusion']
      },
      {
        'question': 'What characteristic is essential for someone in a leadership position?',
        'options': ['a) Following', 'b) Passivity', 'c) Disinterest', 'd) Leadership']
      },
      {
        'question': 'What is an important skill for making informed decisions in the workplace?',
        'options': ['a) Indecision', 'b) Decision-making', 'c) Doubt', 'd) Hesitation']
      },
      {
        'question': 'Which quality allows an employee to adjust to changes in the work environment?',
        'options': ['a) Rigidity', 'b) Resistance', 'c) Adaptability', 'd) Inflexibility']
      },
      {
        'question': 'What characteristic is important for meeting deadlines in the workplace?',
        'options': ['a) Punctuality', 'b) Lateness', 'c) Impunctuality', 'd) Delay']
      },
      {
        'question': 'Which is a valuable skill for handling high-pressure situations at work?',
        'options': ['a) Avoidance', 'b) Nervousness', 'c) Fear', 'd) Working under pressure']
      },
      {
        'question': 'What quality is crucial for fostering new ideas and improvements in the workplace?',
        'options': ['a) Stagnation', 'b) Innovation', 'c) Conformity', 'd) Monotony']
      },
      {
        'question': 'What characteristic is fundamental for maintaining energy and determination at work?',
        'options': ['a) Disheartenment', 'b) Demotivation', 'c) Motivation', 'd) Fatigue']
      },
      {
        'question': 'What type of skills are essential for performing specific tasks at work?',
        'options': ['a) Technical skills', 'b) Soft skills', 'c) Social skills', 'd) Emotional skills']
      },
      {
        'question': 'Which skill is important for organizing and prioritizing tasks at work?',
        'options': ['a) Disorder', 'b) Disorganization', 'c) Chaos', 'd) Time management']
      },
      {
        'question': 'What skill is essential for resolving disputes and maintaining harmony in the workplace?',
        'options': ['a) Ignoring conflicts', 'b) Resolving conflicts', 'c) Provoking conflicts', 'd) Avoiding conflicts']
      },
      {
        'question': 'Which professional value involves acting with integrity and responsibility at work?',
        'options': ['a) Dishonesty', 'b) Irresponsibility', 'c) Professional ethics', 'd) Immorality']
      },
      {
        'question': 'Which skill is essential for setting goals and determining the necessary actions to achieve them?',
        'options': ['a) Disorganization', 'b) Impulsiveness', 'c) Improvisation', 'd) Planning']
      },
      {
        'question': 'What quality is crucial for increasing efficiency and effectiveness at work?',
        'options': ['a) Inactivity', 'b) Productivity', 'c) Procrastination', 'd) Inefficiency']
      },
      {
        'question': 'Which capability is essential for acquiring new knowledge and skills at work?',
        'options': ['a) Learning capability', 'b) Resistance to change', 'c) Disinterest', 'd) Conformity']
      },
      {
        'question': 'Which skill is crucial for reaching beneficial agreements in the workplace?',
        'options': ['a) Imposition', 'b) Authoritarianism', 'c) Negotiation', 'd) Subordination']
      },
      {
        'question': 'Which orientation is fundamental for achieving goals and objectives at work?',
        'options': ['a) Process orientation', 'b) Effort orientation', 'c) Task orientation', 'd) Results orientation']
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Session 1 Tasks',
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
                      'Question $questionNumber',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.red,
                      ),
                    ),
                    if (questionNumber == 1)
                      Text(
                        'Score: $correctCount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.green,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  question,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey,
                        fontStyle: FontStyle.normal,
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
              backgroundColor: Color(0xFFB90000),
            ),
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: areAllQuestionsAnswered() ? verifyAnswers : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFB90000),
            ),
            child: Text(
              'Verify',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
