import 'package:flutter/material.dart';

import 'package:XpenseTracker/Stateless/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final title = 'XpenseTracker';

  var _theme = "dark";

  void _changeTheme() {
    setState(() {
      _theme = _theme == "dark" ? "light" : "dark";
    });
  }

  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return MaterialApp(
      title: 'XpenseTracker',
      theme: _theme == "dark" ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(title, _changeTheme),
    );
  }
}
