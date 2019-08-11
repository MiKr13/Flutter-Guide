import 'package:flutter/material.dart';

import 'package:XpenseTracker/models/transaction.dart';
import 'package:XpenseTracker/Stateless/footer.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Function _changeTheme;
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      description: 'A new shoes for Friday party',
      count: 1,
      costPerItem: 1250,
      total: Transaction.calcTotal(1250, 1),
      date: DateTime.now(),
    )
  ];

  MyHomePage(this.title, this._changeTheme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('Chart!'),
            ),
          ),
          ListView(
            reverse: true,
            children: transactions.map((tx) {
              return Card(
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: tx.title,
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'bold',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' world!'),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.label),
                      title: Text('Two-line ListTile'),
                      subtitle: Text('Here is a second line'),
                      trailing: Icon(Icons.more_vert),
                    ),
                  ],
                ),
              );
            }).toList(),
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
