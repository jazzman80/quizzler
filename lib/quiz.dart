import 'package:flutter/material.dart';

class Quiz {
  ScoreKeeper scoreKeeper = ScoreKeeper();
  int _questionNumber = 0;

  Quiz() {
    scoreKeeper.createIconsPool(_questions.length);
  }

  final List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion(bool playerAnswer) {
    scoreKeeper.setAnswerIcon(
        _questionNumber, isPlayerAnswerCorrect(playerAnswer));
    if (_questionNumber < _questions.length - 1) _questionNumber++;
  }

  String getQuestionText() {
    return _questions[_questionNumber].text;
  }

  bool isPlayerAnswerCorrect({required bool playerAnswer}) {
    if (playerAnswer == _questions[_questionNumber].answer) {
      return true;
    } else {
      return false;
    }
  }
}

class Question {
  String text;
  bool answer;

  Question(this.text, this.answer);
}

class ScoreKeeper {
  final List<Icon> _iconsList = [];

  void createIconsPool(int length) {
    for (int i = 0; i < length; i++) {
      _iconsList.add(
        const Icon(
          Icons.check,
          color: Colors.grey,
        ),
      );
    }
  }

  void setAnswerIcon(int questionNumber, bool isPlayerAnswerCorrect) {
    if (isPlayerAnswerCorrect) {
      _iconsList[questionNumber] = const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      _iconsList[questionNumber] = const Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  List<Icon> getIconsList() {
    return _iconsList;
  }
}
