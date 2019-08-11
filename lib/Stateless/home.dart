
import 'package:flutter/material.dart';

import 'package:XpenseTracker/Stateless/footer.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Function _changeTheme;

  MyHomePage(this.title, this._changeTheme);

  @override
  Widget build(BuildContext context) {
    // build() returns a so-called "widget tree" which tells Flutter what to draw onto the screen
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Text('Chart!'),
          ),
          Card(
            child: Text('List'),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Footer(_changeTheme),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
      ),
    );
  }
}