import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String option;
  final Function buttonPressHandler;

  Answer(this.option, this.buttonPressHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text(
        option,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
        onPressed: buttonPressHandler,
      ),
    );
  }
}
