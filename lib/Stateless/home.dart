import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:XpenseTracker/models/transaction.dart';
import 'package:XpenseTracker/Stateless/footer.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final Function _changeTheme;
  final warningLimit = 800;
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Hrx shoes',
      description: 'A new shoes for Friday party',
      count: 2,
      costPerItem: 1250,
      total: Transaction.calcTotal(1250, 2),
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Hrx shoes',
      description: 'A new shoes for Friday party',
      count: 2,
      costPerItem: 200,
      total: Transaction.calcTotal(200, 2),
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'Hrx shoes',
      description: 'A new shoes for Friday party',
      count: 2,
      costPerItem: 1250,
      total: Transaction.calcTotal(1250, 2),
      date: DateTime.now(),
    ),
  ];

  final List<int> console = [1, 2, 3, 4, 5];

  MyHomePage(this.title, this._changeTheme);

  Future<void> _addNew(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Author Credit'),
          content: SingleChildScrollView(
            child: Card(
              child: Column(
                children: <Widget>[
                  TextField(),
                  TextField(),
                  TextField(),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.plus_one),
                  Text('Submit'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.95],
                colors: [
                  Colors.yellow[200],
                  Colors.cyan[600],
                  Colors.cyan[400],
                  Colors.yellow[100],
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: console.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      child: Center(
                        child: Text(
                          console[index].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 36.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 5.0),
          Flexible(
            child: ListView(
              children: transactions.map((tx) {
                return Card(
                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Column(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: '${tx.count} X ',
                          children: <TextSpan>[
                            TextSpan(
                              text: tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.label,
                          color: Colors.yellow[400],
                        ),
                        isThreeLine: true,
                        title: RichText(
                          text: TextSpan(
                            text: 'Total cost: ',
                            children: <TextSpan>[
                              TextSpan(
                                text: '${tx.total}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: tx.total > warningLimit
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                              TextSpan(text: ' ₹'),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          '${tx.description}\nOn ${DateFormat.yMMMEd().add_jms().format(tx.date)}\nCost Per Item: ${tx.costPerItem}',
                          overflow: TextOverflow.fade,
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.more_vert),
                          tooltip: 'More',
                          onPressed: () async {},
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Footer(_changeTheme),
      ),
      floatingActionButton: InkWell(
        splashColor: Colors.black.withAlpha(25),
        highlightColor: Colors.black.withAlpha(25),
        onTap: () {
          _addNew(context);
        },
        child: FloatingActionButton(
          child: Icon(Icons.playlist_add),
          tooltip: 'Add More',
          onPressed: null,
        ),
      ),
    );
  }
}
