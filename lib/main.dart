import 'package:flutter/material.dart';
import 'quiz.dart';

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
  Quiz quiz = Quiz();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              quiz.getQuestionText(),
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
                    quiz.nextQuestion(true);
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
                    quiz.nextQuestion(playerAnswer: false);
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
          children: quiz.scoreKeeper.getIconsList(),
        )
      ],
    );
  }
}
