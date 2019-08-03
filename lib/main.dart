import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_guide/Stateless/title.dart' as title;
import 'package:flutter_guide/Stateless/question.dart' as question;
import 'package:flutter_guide/Stateless/answer.dart' as answer;
import 'package:flutter_guide/Stateless/footer.dart' as footer;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _questions = [
    "What is the number of states in India?",
    "Which is the first state to be formed on the basis of language?",
    "Which state was divided into Maharashtra and Gujarat in 1960?",
    "Which city was the summer capital of India during British Rule?"
  ];

  var _index = 0;
  void _changeQuestion() {
    setState(() {
      if (_index == _questions.length - 1) {
        _index = 0;
      } else {
        _index++;
      }
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
        // primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: _theme,
        // primaryColor: Colors.blue,
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
                color: Colors.blueGrey[400],
                child: Column(
                  children: <Widget>[
                    Center(
                      child: question.Question(_questions[_index]),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 25.0,
                      crossAxisSpacing: 25.0,
                      padding: EdgeInsets.all(25),
                      children: <Widget>[
                        answer.Answer('14', _changeQuestion),
                        answer.Answer('27', _changeQuestion),
                        answer.Answer('29', _changeQuestion),
                        answer.Answer('NA', _changeQuestion),
                      ],
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
