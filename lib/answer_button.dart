import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this. value,required this.onAnswer, super.key});
  final String value;
  final Function() onAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: onAnswer,
          style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size.fromWidth(300))),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          )),
    );
  }
}
