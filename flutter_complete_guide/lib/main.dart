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
  final questions = const [
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
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('NO more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    // .map(value){return ???} => 리스트의 각각의 원소를 value로 받고 함수안에서 return 값을 Iterable(list, map 등등의 조상?)로 다시 저장
                    return Answer(_answerQuestion, answer);
                  }).toList() // 그래서 toList없어도 작동함

                  /// ...은 리스트 안에 리스트가 들어가게 생겼는데 이 안의 리스트의 원소를 쪼개서 넣어서 [A, [B, C, D]] => [A, B, C, D] 이렇게 만들어줌
                ],
              )
            : Center(child: Text('You did it!')),
      ),
    );
  }
}
