import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:QUIZmania/Stateless/footer.dart' as footer;
import 'package:QUIZmania/Statefull/app.dart' as mainApp;

void main() => runApp(Root());

class Root extends StatefulWidget {

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  var _theme = Brightness.dark;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  void _changeTheme() {
    setState(() {
      _theme = _theme == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
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
