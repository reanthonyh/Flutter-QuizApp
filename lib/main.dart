// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _questions = [
    "What's your first name?",
    "What's your favorite animal?",
    "What's your favorite movie?",
  ];

  final List<Map<String, Object>> _data = [
    {
      "question": "What's your favorite language?",
      "answers": [
        {"text": "JavaScript", "points": 5},
        {"text": "Java", "points": 8},
        {"text": "Dart", "points": 9},
        {"text": "Python", "points": 3},
        {"text": "Rust", "points": 4},
      ]
    },
    {
      "question": "What's your favorite animal?",
      "answers": [
        {"text": "Lion", "points": 11},
        {"text": "Horse", "points": 10},
        {"text": "Bear", "points": 9},
        {"text": "Cocodrile", "points": 8},
        {"text": "Panda", "points": 5},
        {"text": "Gorilla", "points": 12},
      ]
    },
    {
      "question": "What's the capital of Peru?",
      "answers": [
        {"text": "Lima", "points": 10},
        {"text": "Ica", "points": 5},
        {"text": "Trujillo", "points": 7},
        {"text": "Arequipa", "points": 5},
      ]
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void questionAnswer(int points) {
    setState(() {
      _questionIndex++;
      _totalScore += points;
      print("Estamos en la pregunta $_questionIndex");
      print("Con un puntaje de $_totalScore");
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      print("ResetQuiz !");
      // print("El valor de answers: ${_data[0]['answers'].runtimeType}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My first App"),
          actions: [
            IconButton(
              icon: const Icon(Icons.restart_alt),
              onPressed: resetQuiz,
            )
          ],
        ),
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: _questionIndex != _questions.length
                ? Question(
                    questionText: _data[_questionIndex]['question'] as String,
                    answers: _data[_questionIndex]['answers'],
                    callback: questionAnswer)
                : Result(points: _totalScore)),
      ),
    );
  }
}
