import 'package:flutter/material.dart';
import 'medical_stuts.dart';

class MemoryCheckTest extends StatefulWidget {
  @override
  _MemoryCheckTestState createState() => _MemoryCheckTestState();
}

class _MemoryCheckTestState extends State<MemoryCheckTest> {
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is your full name?',
      'answers': ['John Doe', 'Jane Doe', 'Joe Bloggs', 'Don\'t Know'],
      'correctAnswer': ['John Doe'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your date of birth?',
      'answers': [
        'January 1, 2000',
        'March 5, 1995',
        'December 12, 1985',
        'Don\'t Know'
      ],
      'correctAnswer': ['January 1, 2000'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your mother\'s maiden name?',
      'answers': ['Smith', 'Johnson', 'Williams', 'Don\'t Know'],
      'correctAnswer': ['Smith'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What year did World War II end?',
      'answers': ['1942', '1945', '1950', 'Don\'t Know'],
      'correctAnswer': ['1945'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'Who was the first president of the United States?',
      'answers': [
        'George Washington',
        'Abraham Lincoln',
        'Thomas Jefferson',
        'Don\'t Know'
      ],
      'correctAnswer': ['George Washington'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What are your children\'s names?',
      'answers': [
        'John and Sarah',
        'Emily and Michael',
        'Sophia',
        'Don\'t Know'
      ],
      'correctAnswer': ['John and Sarah'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your spouse\'s name?',
      'answers': ['Jane', 'Michael', 'Emily', 'Don\'t Know'],
      'correctAnswer': ['Jane'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'Where did you go for your last vacation?',
      'answers': ['Paris', 'New York', 'Maldives', 'Don\'t Know'],
      'correctAnswer': ['Maldives'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your favorite hobby?',
      'answers': ['Reading', 'Playing sports', 'Cooking', 'Don\'t Know'],
      'correctAnswer': ['Reading'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What city were you born in?',
      'answers': ['New York', 'London', 'Sydney', 'Don\'t Know'],
      'correctAnswer': ['New York'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your favorite food?',
      'answers': ['Pizza', 'Sushi', 'Burger', 'Don\'t Know'],
      'correctAnswer': ['Pizza'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is the name of your high school?',
      'answers': ['Central High', 'West High', 'North High', 'Don\'t Know'],
      'correctAnswer': ['Central High'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What year did you graduate from college?',
      'answers': ['2000', '2010', '1995', 'Don\'t Know'],
      'correctAnswer': ['2000'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your mother\'s maiden name?',
      'answers': ['Smith', 'Johnson', 'Williams', 'Don\'t Know'],
      'correctAnswer': ['Smith'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your father\'s middle name?',
      'answers': ['James', 'Michael', 'David', 'Don\'t Know'],
      'correctAnswer': ['James'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is the name of your first pet?',
      'answers': ['Max', 'Bella', 'Charlie', 'Don\'t Know'],
      'correctAnswer': ['Max'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your favorite movie genre?',
      'answers': ['Action', 'Comedy', 'Drama', 'Don\'t Know'],
      'correctAnswer': ['Action'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Blue', 'Red', 'Green', 'Don\'t Know'],
      'correctAnswer': ['Blue'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is the name of your favorite childhood teacher?',
      'answers': ['Ms. Johnson', 'Mr. Smith', 'Mrs. Brown', 'Don\'t Know'],
      'correctAnswer': ['Ms. Johnson'],
      'selectedAnswers': <String>[],
    },
    {
      'questionText': 'What is your Zodiac sign?',
      'answers': ['Leo', 'Virgo', 'Scorpio', 'Don\'t Know'],
      'correctAnswer': ['Leo'],
      'selectedAnswers': <String>[],
    },
  ];

  void _calculateScore() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      List<String> selectedAnswers =
          _questions[i]['selectedAnswers'] as List<String>;
      List<String> correctAnswers =
          _questions[i]['correctAnswer'] as List<String>;
      bool allCorrect = true;
      for (String answer in correctAnswers) {
        if (!selectedAnswers.contains(answer)) {
          allCorrect = false;
          break;
        }
      }
      if (allCorrect && selectedAnswers.isNotEmpty) {
        score += 1;
      }
    }
    setState(() {
      _score = score;
    });
  }

  String _getScoreCategory(int score) {
    if (score >= 10) {
      return 'High';
    } else if (score == 5) {
      return 'Normal';
    } else {
      return 'Low';
    }
  }

  void _resetTest() {
    setState(() {
      _score = 0;
      for (int i = 0; i < _questions.length; i++) {
        _questions[i]['selectedAnswers'] = <String>[];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Check Test'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/persons/bk3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _questions.length,
          itemBuilder: (ctx, index) {
            List<String> answers = _questions[index]['answers'] as List<String>;
            List<String> selectedAnswers =
                _questions[index]['selectedAnswers'] as List<String>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _questions[index]['questionText'] as String,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
                ...answers.map((answer) {
                  bool isChecked = selectedAnswers.contains(answer);
                  return CheckboxListTile(
                    title: Text(
                      answer,
                      style: TextStyle(color: Colors.black),
                    ),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value ?? false) {
                          selectedAnswers.add(answer);
                        } else {
                          selectedAnswers.remove(answer);
                        }
                      });
                    },
                    activeColor: Colors.white,
                    checkColor: Colors.blue,
                  );
                }).toList(),
                Divider(color: Colors.white),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _calculateScore();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Memory Check Test Results'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Score: $_score',
                        style: TextStyle(fontSize: 18.0)),
                    Text('Memory Performance: ${_getScoreCategory(_score)}',
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _resetTest();
                    },
                    child: Text('Reset Test'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to MedicalStatusPage and replace the current page
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MedicalStatusPage(),
                      ));
                    },
                    child: Text('End Test'),
                  ),
                ],
              );
            },
          );
        },
        label: Text('Done'),
        icon: Icon(Icons.done),
      ),
    );
  }
}
