import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_guide/Stateless/title.dart' as title;
import 'package:flutter_guide/Stateless/question.dart' as questionSection;
import 'package:flutter_guide/Stateless/answer.dart' as answer;
import 'package:flutter_guide/Stateless/footer.dart' as footer;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // understand final vs const
  // static const List<Map<String, Object>> _questions = [ use static with const to satisfy Dart as it doesn't allows const at Class level or,
  final List<Map<String, Object>> _questions = const [
    {
      'questionText': 'What is the number of states in India?',
      'options': ['14', '27', '29', 'NA'],
      'answer': '29'
    },
    {
      'questionText':
          'Which is the first state to be formed on the basis of language?',
      'options': ['Andhra Pradesh', 'Bombay', 'Madhya Bharat', 'Meghalaya'],
      'answer': 'Andhra Pradesh'
    },
    {
      'questionText':
          'Which state was divided into Maharashtra and Gujarat in 1960?',
      'options': ['Bombay', 'Madras', 'Mysore', 'Hyderabad'],
      'answer': 'Bombay'
    },
    {
      'questionText':
          'Which city was the summer capital of India during British Rule?',
      'options': ['Ooty', 'Simla', 'Pachmarhi', 'Matheran'],
      'answer': 'Simla'
    }
  ];

  void _showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.blue[300],
        textColor: Colors.white70,
        fontSize: 19.0);
  }

  var _index = 0;
  void _checkAndChangeQuestion(String choice) {
    if (choice == _questions[_index]['answer']) {
      _showToast('Right Answer');
    } else {
      _showToast('Wrong Answer');
    }
    setState(() {
      // if (_index == _questions.length - 1) {
      //   _index = 0;
      // } else {
      //   _index++;
      // }
      _index++;
    });
  }

  void _reset() {
    setState(() {
      _index = 0;
    });
  }

  var _theme = Brightness.dark;
  void _changeTheme() {
    setState(() {
      _theme = _theme == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light, // to enable dark theme by default instead of battery saver mode only
        brightness: _theme,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZmania'),
        ),
        body: Column(
          children: <Widget>[
            title.Title(),
            Container(
              child: Card(
                elevation: 15.0,
                // color: Colors.blueGrey[400],
                child: _index <= _questions.length - 1
                    ? Column(
                        children: <Widget>[
                          Center(
                            child: questionSection.Question(
                                _questions[_index]['questionText']),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 25.0,
                            crossAxisSpacing: 25.0,
                            padding: EdgeInsets.all(25),
                            children: <Widget>[
                              ...(_questions[_index]['options'] as List<String>)
                                  .map((option) {
                                return answer.Answer(
                                    option, _checkAndChangeQuestion);
                              }).toList(), // ... spread is used to populate list elements into children os GridView.count
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Text(
                              'All Questions answered.\nYou did it!',
                              style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
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
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.none,
          child: footer.MyFooter(_changeTheme),
        ),
      ),
    );
  }
}
