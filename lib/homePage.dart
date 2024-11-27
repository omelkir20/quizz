import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var questions = [
    {
      "question": "What is your favorite pet?",
      "answers": [
        {"answer": "Dog", "score": 10},
        {"answer": "Cat", "score": 5},
        {"answer": "Rabbit", "score": 3},
        {"answer": "Lion", "score": 1},
      ],
    },
    {
      "question": "What is your favorite car?",
      "answers": [
        {"answer": "Ferrari", "score": 10},
        {"answer": "Porsche", "score": 5},
        {"answer": "404", "score": 3},
      ],
    },
    {
      "question": "What is your favorite color?",
      "answers": [
        {"answer": "Red", "score": 10},
        {"answer": "Blue", "score": 5},
        {"answer": "Yellow", "score": 3},
        {"answer": "Green", "score": 1},
      ],
    },
  ];

  // Index pour suivre la question actuelle
  int quesIndex = 0;
  int score = 0;

  void question_next() {
    setState(() {
      quesIndex++;
    });
  }

  void calcul_score(int score) {
    setState(() {
      this.score += score;
    });
  }

  void resetQuiz() {
    setState(() {
      quesIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: quesIndex < questions.length
          ? Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.only(top: 200),
              child: Text(
                questions[quesIndex]["question"] as String,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ...(questions[quesIndex]["answers"] as List<Map<String, Object>>)
              .map(
                (e) => Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                onPressed: () {
                  calcul_score(e["score"] as int);
                  question_next();
                },
                child: Text(e["answer"] as String),
              ),
            ),
          )
              .toList(),
        ],
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Votre score est $score",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetQuiz,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
