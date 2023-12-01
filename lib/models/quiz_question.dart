class QuizQuestion {
  QuizQuestion(this.question, this.answer);

  final String question;
  final List answer;

  List getRandomAnswers() {
    final randomList = List.of(answer);
    randomList.shuffle();
    return randomList;
  }
}
