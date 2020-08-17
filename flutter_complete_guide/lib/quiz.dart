import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          // .map(value){return ???} => 리스트의 각각의 원소를 value로 받고 함수안에서 return 값을 Iterable(list, map 등등의 조상?)로 다시 저장
          return Answer(answerQuestion, answer);
        }).toList() // 그래서 toList없어도 작동함

        /// ...은 리스트 안에 리스트가 들어가게 생겼는데 이 안의 리스트의 원소를 쪼개서 넣어서 [A, [B, C, D]] => [A, B, C, D] 이렇게 만들어줌
      ],
    );
  }
}
