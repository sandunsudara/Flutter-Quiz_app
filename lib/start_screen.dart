import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StartScreeen extends StatelessWidget {
  StartScreeen({super.key, required this.onAction});

  Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Let \'s do some Quizzzs...',
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
        const SizedBox(height: 50),
        Image.asset(
          'assets/images/options.png',
          height: 340,
        ),
        const SizedBox(height: 50),
        ElevatedButton(
            onPressed: () {
              onAction('quiz');
            },
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 55),
                elevation: 10,
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(179, 109, 234, 86)),
            child: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            )),
      ],
    ));
  }
}
