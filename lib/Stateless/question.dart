import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // final tells dart that this will never change after first initialization

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
