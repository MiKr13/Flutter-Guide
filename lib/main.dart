import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

import 'package:flutter_guide/Stateless/title.dart' as title;
import 'package:flutter_guide/Stateless/question.dart' as question;

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

  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // brightness: Brightness.light, // to enable dark theme by default instead of battery saver mode only
        brightness: Brightness.dark,
        // primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    question.Question(_questions[_index]),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 25.0,
                      crossAxisSpacing: 25.0,
                      padding: EdgeInsets.all(25),
                      children: <Widget>[
                        RaisedButton(
                          child: Text('14'),
                          onPressed: _changeQuestion,
                        ),
                        RaisedButton(
                          child: Text('27'),
                          onPressed: null,
                        ),
                        RaisedButton(
                          child: Text('29'),
                          onPressed: null,
                        ),
                        RaisedButton(
                          child: Text('None of the above'),
                          onPressed: null,
                        ),
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
          child: MyFooter(),
        ),
      ),
    );
  }
}

class MyFooter extends StatelessWidget {
  // NOTE using 'new' keyword or not before every Widget class instantiation depends on us!
  const MyFooter({Key key}) : super(key: key);

  void vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 50);
    }
  }

  Future<void> _support(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Author Credit'),
          content: SingleChildScrollView(
            child: ListTile(
              leading: Icon(Icons.sentiment_very_satisfied),
              title: Text('Developed by: Mihir Kumar'),
              subtitle: RichText(
                text: TextSpan(
                  text: 'View other projects @Github',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      const url = 'https://github.com/MiKr13/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                ),
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_back),
                  Text(' Go Back'),
                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromRGBO(30, 144, 255, 0.1),
        child: InkWell(
          splashColor: Colors.black.withAlpha(20),
          onLongPress: () {
            vibrate();
            _support(context);
          },
          child: Container(
            child: ListTile(
              // leading: FlatButton(
              //   child: Icon(Icons.arrow_back),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              title: Text('Flutter Quiz App'),
              subtitle: Text('This is created to learn Flutter layout & maps'),
              // trailing: Icon(Icons.code),
              trailing: FlatButton(
                child: Icon(Icons.developer_mode),
                onPressed: () async {
                  const url = 'https://github.com/MiKr13/Flutter-Guide.git';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
