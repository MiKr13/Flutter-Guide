import 'package:flutter/material.dart';

import 'package:flutter_guide/Stateless/answer.dart';
import 'package:flutter_guide/Stateless/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function checkAndChangeQuestion;
  final index;

  Quiz(this.questions, this.index, this.checkAndChangeQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Question(questions[index]['questionText']),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 25.0,
          crossAxisSpacing: 25.0,
          padding: EdgeInsets.all(25),
          children: <Widget>[
            ...(questions[index]['options'] as List<String>).map((option) {
              return Answer(option, checkAndChangeQuestion);
            }).toList(), // ... spread is used to populate list elements into children os GridView.count
          ],
        ),
      ],
    );
  }
}
