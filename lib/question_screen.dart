import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key,
      required this.onAction(String value),
      required this.onSelectAnswer,
      required this.questionsList});
  final Function(String) onAction;
  final Function(String) onSelectAnswer;
  final List<QuizQuestion> questionsList;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQestionindex = 0;
  List qestionAndAnswer = [];

  void nextQestion() {
    if (currentQestionindex < 5) {
      setState(() {
        currentQestionindex++;
      });
    } else {
      widget.onAction('score');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Qestion - ${currentQestionindex + 1}',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 0, 0, 0),
              shadows: [
                Shadow(
                    color: Color.fromARGB(255, 255, 255, 255),
                    offset: Offset(2, 2))
              ]),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          widget.questionsList[currentQestionindex].question,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        ...widget.questionsList[currentQestionindex]
            .getRandomAnswers()
            .map((e) => AnswerButton(
                value: e,
                onAnswer: () {
                  nextQestion();
                  widget.onSelectAnswer(e);
                })),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {
              widget.onAction('start');
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 55),
                elevation: 10,
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(179, 109, 234, 86)),
            child: const Text(
              'Go Back',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )),
      ],
    ));
  }
}
