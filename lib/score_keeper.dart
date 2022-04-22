import 'package:flutter/material.dart';

class ScoreKeeper {
  final List<Icon> _iconsList = [];

  ScoreKeeper(int length) {
    createIconsPool(length);
  }

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

  void reloadIconsPool() {
    for (int i = 0; i < _iconsList.length; i++) {
      _iconsList[i] = const Icon(
        Icons.check,
        color: Colors.grey,
      );
    }
  }

  void setAnswerIcon(bool isPlayerAnswerCorrect, int answerNumber) {
    if (isPlayerAnswerCorrect) {
      _iconsList[answerNumber] = const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      _iconsList[answerNumber] = const Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  List<Icon> getIconsList() {
    return _iconsList;
  }
}
