import 'package:flutter/material.dart';

class Title extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
      child: RichText(
        text: TextSpan(
          text: 'The Questions!',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey[200],
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
