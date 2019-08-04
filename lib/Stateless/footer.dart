import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:vibration/vibration.dart';

class Footer extends StatelessWidget {
  // NOTE using 'new' keyword or not before every Widget class instantiation depends on us!
  final Function themeChangeHandler;

  Footer(this.themeChangeHandler);

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
                  Icon(Icons.compare),
                  Text(' Change Theme'),
                ],
              ),
              onPressed: themeChangeHandler,
            ),
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
              title: Text('Flutter Quiz App'),
              subtitle: Text('This is created to learn Flutter layout & maps'),
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
