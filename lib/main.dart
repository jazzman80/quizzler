import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz.dart';
import 'score_keeper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child: MainPage(),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static Quiz quiz = Quiz();
  ScoreKeeper scoreKeeper = ScoreKeeper(quiz.getNumberOfQuestions());

  @override
  Widget build(BuildContext context) {
    showGameOverDialog() {
      Alert(
        context: context,
        title: 'Game Over',
        style: const AlertStyle(
          isCloseButton: false,
          isOverlayTapDismiss: false,
        ),
        buttons: [
          DialogButton(
            child: const Text('Restart Quiz'),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                quiz.restartGame();
                scoreKeeper.reloadIconsPool();
              });
            },
          ),
        ],
      ).show();
    }

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              quiz.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (quiz.isGameOver()) showGameOverDialog();
                    scoreKeeper.setAnswerIcon(
                      quiz.isPlayerAnswerCorrect(true),
                      quiz.getQuestionNumber(),
                    );
                    quiz.nextQuestion();
                  });
                },
                child: const Text('Yes'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  fixedSize: const Size(150, 50),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (quiz.isGameOver()) showGameOverDialog();
                    scoreKeeper.setAnswerIcon(quiz.isPlayerAnswerCorrect(false),
                        quiz.getQuestionNumber());
                    quiz.nextQuestion();
                  });
                },
                child: const Text('No'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: const Size(150, 50),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreKeeper.getIconsList(),
        )
      ],
    );
  }
}
