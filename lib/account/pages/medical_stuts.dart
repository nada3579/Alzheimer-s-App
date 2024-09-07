import 'package:flutter/material.dart';

class MedicalStatusPage extends StatefulWidget {
  const MedicalStatusPage({super.key});

  @override
  _MedicalStatusPageState createState() => _MedicalStatusPageState();
}

class _MedicalStatusPageState extends State<MedicalStatusPage> {
  final List<Map<String, String>> _medicalStatuses = [
    {'status': 'Memory Check', 'value': 'Normal'},
    {'status': 'Mood', 'value': 'Calm'},
    {'status': 'Medication', 'value': 'Donepezil 10mg'},
    {'status': 'Nutrition', 'value': 'Balanced Diet'},
  ];

  void _navigateToMemoryCheckTest() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemoryCheckTest(
          onTestComplete: (result) {
            setState(() {
              _medicalStatuses[0]['value'] = result;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medical Status',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6e9fa4),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditStatusPage(
                    medicalStatuses: _medicalStatuses,
                    onSave: (updatedStatuses) {
                      setState(() {
                        _medicalStatuses.clear();
                        _medicalStatuses.addAll(updatedStatuses);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/persons/bk3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: constraints.maxWidth > 600 ? 3 : 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _medicalStatuses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (_medicalStatuses[index]['status'] ==
                            'Memory Check') {
                          _navigateToMemoryCheckTest();
                        }
                      },
                      child: FractionallySizedBox(
                        widthFactor: 0.95,
                        heightFactor: 0.95,
                        child: medicalStatusCard(index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget medicalStatusCard(int index) {
    return Card(
      color: _getCardColor(index),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getStatusIcon(index),
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 10),
            FittedBox(
              child: Text(
                _medicalStatuses[index]['status']!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            FittedBox(
              child: Text(
                _medicalStatuses[index]['value']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCardColor(int index) {
    switch (_medicalStatuses[index]['status']) {
      case 'Memory Check':
        switch (_medicalStatuses[index]['value']) {
          case 'Bad':
            return Colors.red;
          case 'Normal':
            return Colors.green;
          case 'Good':
            return Colors.blue;
        }
        break;
      case 'Mood':
        switch (_medicalStatuses[index]['value']) {
          case 'Calm':
            return Colors.blue;
          case 'Angry':
            return Colors.red;
          case 'Sad':
            return Colors.orange;
          case 'Happy':
            return Colors.green;
        }
        break;
      case 'Medication':
        return Colors.orange;
      case 'Nutrition':
        return Colors.purple;
    }
    return Colors.grey;
  }

  IconData _getStatusIcon(int index) {
    switch (_medicalStatuses[index]['status']) {
      case 'Memory Check':
        return Icons.memory;
      case 'Mood':
        return Icons.mood;
      case 'Medication':
        return Icons.medical_services;
      case 'Nutrition':
        return Icons.restaurant;
      default:
        return Icons.info;
    }
  }
}

class EditStatusPage extends StatefulWidget {
  final List<Map<String, String>> medicalStatuses;
  final Function(List<Map<String, String>>) onSave;

  EditStatusPage({required this.medicalStatuses, required this.onSave});

  @override
  _EditStatusPageState createState() => _EditStatusPageState();
}

class _EditStatusPageState extends State<EditStatusPage> {
  late List<Map<String, String>> _medicalStatuses;

  @override
  void initState() {
    super.initState();
    _medicalStatuses = List.from(widget.medicalStatuses);
  }

  void _updateStatusValue(int index, String newValue) {
    setState(() {
      _medicalStatuses[index]['value'] = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Medical Status',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF6e9fa4),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            onPressed: () {
              widget.onSave(_medicalStatuses);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/persons/doc.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            itemCount: _medicalStatuses.length,
            itemBuilder: (context, index) {
              return _medicalStatuses[index]['status'] == 'Medication' ||
                      _medicalStatuses[index]['status'] == 'Nutrition'
                  ? ListTile(
                      title: Text(
                        _medicalStatuses[index]['status']!,
                        style: const TextStyle(color: Colors.black),
                      ),
                      trailing: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: TextEditingController(
                            text: _medicalStatuses[index]['value'],
                          ),
                          onChanged: (newValue) {
                            _updateStatusValue(index, newValue);
                          },
                          decoration: InputDecoration(
                            hintText:
                                'Enter ${_medicalStatuses[index]['status']!.toLowerCase()} details',
                          ),
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ],
      ),
    );
  }
}

class MemoryCheckTest extends StatefulWidget {
  final Function(String) onTestComplete;

  MemoryCheckTest({required this.onTestComplete});

  @override
  _MemoryCheckTestState createState() => _MemoryCheckTestState();
}

class _MemoryCheckTestState extends State<MemoryCheckTest> {
  int _score = 0;
  List<String> _selectedAnswers = List.filled(_questions.length, '');

  static final List<Map<String, Object>> _questions = [
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

  void _submit() {
    _score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == _questions[i]['correctAnswer']) {
        _score++;
      } else if (_selectedAnswers[i] != 'Don\'t Know') {
        _score--;
      }
    }

    String result = _getScoreCategory(_score);
    widget.onTestComplete(result);

    Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Check Test'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/persons/bk3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            itemCount: _questions.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      _questions[index]['questionText'] as String,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  ...(_questions[index]['answers'] as List<String>)
                      .map((answer) {
                    return CheckboxListTile(
                      title: Text(answer),
                      value: _selectedAnswers[index] == answer,
                      onChanged: (bool? value) {
                        setState(() {
                          _selectedAnswers[index] = answer;
                        });
                      },
                    );
                  }).toList(),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              child: Icon(Icons.done),
              onPressed: _submit,
            ),
          ),
        ],
      ),
    );
  }
}
