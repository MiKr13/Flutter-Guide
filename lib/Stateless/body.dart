import 'package:flutter/material.dart';

import 'package:QUIZmania/Stateless/title.dart' as title;
import 'package:QUIZmania/Stateless/quiz.dart';
import 'package:QUIZmania/Stateless/result.dart';

class Body extends StatelessWidget {
  final List<Map<String, Object>> _questions;
  final Function _checkAndChangeQuestion;
  final int _index, _correctCount;
  final Function _reset;

  const Body(
      this._questions, this._index, this._checkAndChangeQuestion, this._reset, this._correctCount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        title.Title(),
        Container(
          width: double.infinity,
          child: Card(
            elevation: 15.0,
            child: _index <= _questions.length - 1
                ? Quiz(_questions, _index, _checkAndChangeQuestion)
                : Result(_reset, _correctCount, _questions.length),
          ),
        ),
      ],
    );
  }
}
