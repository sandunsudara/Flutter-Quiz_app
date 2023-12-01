import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/models/quiz_question.dart';
import 'package:quiz/question_screen.dart';
import 'package:quiz/score_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var screen = 'start';
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  List qestionAndAnswer = [];
  List<QuizQuestion> questionsList = [];

  @override
  initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/q&a.json');
    final data = await json.decode(response);
    // print('Json Read Method : $data');
    setState(() {
      qestionAndAnswer = data["qestionAndAnswer"];
      // print('Method : $qestionAndAnswer');
      for (var element in qestionAndAnswer) {
        questionsList.add(QuizQuestion(element["qestion"], element["answers"]));
      }
    });
  }

  void onScreenChange(String value) {
    if (value == 'start') {
      selectedAnswers = [];
    }
    setState(() {
      screen = value;
    });
  }

  void onAnswerSelect(String value) {
    setState(() {
      selectedAnswers.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    activeScreen = StartScreeen(onAction: onScreenChange);
    if (screen == 'quiz') {
      activeScreen = QuestionScreen(
          onAction: onScreenChange,
          onSelectAnswer: onAnswerSelect,
          questionsList: questionsList);
    }
    if (screen == 'start') {
      activeScreen = StartScreeen(onAction: onScreenChange);
    }
    if (screen == 'score') {
      activeScreen = ScoreScreen(
          onAction: onScreenChange,
          selectedAnswers: selectedAnswers,
          questionsList: questionsList);
    }
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.white,
                Color.fromARGB(169, 82, 232, 112),
                Color.fromARGB(255, 8, 107, 28)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: activeScreen)),
    );
  }
}
