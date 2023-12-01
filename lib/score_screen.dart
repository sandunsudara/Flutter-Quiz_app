import 'package:flutter/material.dart';
import 'package:quiz/models/quiz_question.dart';

// ignore: must_be_immutable
class ScoreScreen extends StatelessWidget {
  ScoreScreen(
      {super.key,
      required this.onAction,
      required this.selectedAnswers,
      required this.questionsList});
  final Function(String value) onAction;
  final List<String> selectedAnswers;
  final List<QuizQuestion> questionsList;

  int correctAnswerCount = 0;

  List<Map<String, Object>> getResultSummary() {
    List<Map<String, Object>> result = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      result.add({
        'index': i + 1,
        'question': questionsList[i].question,
        'correctAnswer': questionsList[i].answer[0],
        'givenAnswer': selectedAnswers[i]
      });
    }
    return result;
  }

  checkAnswer() {
    List list = getResultSummary();
    for (var i = 0; i < selectedAnswers.length; i++) {
      if (list[i]['correctAnswer'] == list[i]['givenAnswer']) {
        correctAnswerCount++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    checkAnswer();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Result',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 0, 0, 0),
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        offset: Offset(2, 2))
                  ]),
            ),
            Text(
              '$correctAnswerCount Out Of 6',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
            ),
            ...getResultSummary().map((e) {
              if (e['correctAnswer'] == e['givenAnswer']) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromARGB(70, 0, 136, 255),
                  shadowColor: Colors.deepPurpleAccent,
                  child: ListTile(
                    leading: Text(
                      'Q${e['index']}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                    title: Text(
                      e['question'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text('Answer : ${e['correctAnswer']}'),
                    subtitleTextStyle: const TextStyle(color: Colors.black),
                  ),
                );
              } else {
                return Card(
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromARGB(112, 251, 0, 0),
                  shadowColor: Colors.deepPurpleAccent,
                  child: ListTile(
                    leading: Text(
                      'Q${e['index']}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    title: Text(
                      e['question'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                        'Correct Answer : ${e['correctAnswer']} \nGiven Answer    : ${e['givenAnswer']}'),
                    subtitleTextStyle: const TextStyle(color: Colors.black),
                  ),
                );
              }
            }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  onAction('start');
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 55),
                    elevation: 10,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(179, 109, 234, 86)),
                child: const Text(
                  'Restart',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
