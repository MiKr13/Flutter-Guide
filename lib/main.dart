import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
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
      home: MyHomePage(title: 'Flutter Guide'),
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
              leading: Icon(Icons.code),
              title: Text('Flutter Guide'),
              subtitle: Text('This is created to learn flutter ASAP'),
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) { // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "You have clicked add button this many times: ${_counter > 10 ? ' (Stop please!)' : ''}",
                  ),
                  RichText(
                    text: TextSpan(
                      text: '$_counter',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey[200],
                        height: 1.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: MyFooter(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        highlightElevation: 2.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
