import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function _reset;
  final int _correctCount, _total;

  Result(this._reset, this._correctCount, this._total);

  String get resultPhrase {
    return _correctCount == _total ? "You're the best 🎉" : "Try to do better next time"; 
  }

  @override
  Widget build(BuildContext context) {
    final indication = _correctCount / _total > 0.75;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              children: <Widget>[
                Text(
                  'All Questions answered.\nYou did it!\nYour Final Score is:\n',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$_correctCount out of $_total',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: indication ? Colors.green[400] : Colors.red[400],
                    fontSize: 85,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\n$resultPhrase',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: RaisedButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.restore_page),
                  Text(' Reset'),
                ],
              ),
              onPressed: () => _reset(),
            ),
          ),
        ],
      ),
    );
  }
}
