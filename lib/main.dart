import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'XpenseTracker'),
    );
  }
}

class Footer extends StatelessWidget {

  void vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 50);
    }
  }

  Future<void> _supportAuthor(BuildContext context) async {
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
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 30.0,
      clipBehavior: Clip.none,
      child: Container(
        child: InkWell(
          splashColor: Colors.black.withAlpha(25),
          highlightColor: Colors.black.withAlpha(25),
          onLongPress: () {
            vibrate();
            _supportAuthor(context);
          },
          onDoubleTap: () {
            vibrate();
            _supportAuthor(context);
          },
          child: Container(
            child: ListTile(
              title: Text('XpenseTracker'),
              subtitle: Text('This is created to learn flutter ASAP'),
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


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void vibrate() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 250);
    }
  }

  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        child: Footer(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: null,),
    );
  }
}
