import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
//void main() {
//  runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questoins = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Blank', 'Red', 'Greand', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'What\'s your favorite Fruit?',
        'answers': ['Apple', 'Peach', 'Melon', 'grape'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questoins[_questionIndex]['questionText'],
            ),
            ...(questoins[_questionIndex]['answers'] as List<String>).map((answer){
              return Answer(_answerQuestion, answer);
            }).toList()/// ...은 리스트 안에 리스트가 들어가게 생겼는데 이 안의 리스트의 원소를 쪼개서 넣어서 [A, [B, C, D]] => [A, B, C, D] 이렇게 만들어줌
          ],
        ),
      ),
    );
  }
}
