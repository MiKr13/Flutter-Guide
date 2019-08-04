import 'package:flutter/material.dart';

import 'package:flutter_guide/Stateless/answer.dart';
import 'package:flutter_guide/Stateless/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final Function _checkAndChangeQuestion;
  final _index;

  Quiz(this._questions, this._index, this._checkAndChangeQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
          child: Text(
            '${_index + 1}/${_questions.length}',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic),
          ),
        ),
        Center(
          child: Question(_questions[_index]['questionText']),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 25.0,
          crossAxisSpacing: 25.0,
          padding: EdgeInsets.all(25),
          children: <Widget>[
            ...(_questions[_index]['options'] as List<String>).map((option) {
              return Answer(option, _checkAndChangeQuestion);
            }).toList(), // ... spread is used to populate list elements into children os GridView.count
          ],
        ),
      ],
    );
  }
}
