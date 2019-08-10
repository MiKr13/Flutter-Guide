import 'package:flutter/material.dart';

import 'package:flutter_guide/Stateless/footer.dart' as footer;
import 'package:flutter_guide/Statefull/main.dart' as mainApp;

void main() => runApp(Root());

class Root extends StatefulWidget {

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
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
      title: 'QUIZmania',
      theme: ThemeData(
        brightness: _theme,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZmania'),
        ),
        body: mainApp.Main(),
        bottomNavigationBar: footer.Footer(_changeTheme),
      ),
    );
  }
}
