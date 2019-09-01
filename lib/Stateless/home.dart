import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
      id: 't2',
      title: 'Hrx shoes',
      description: 'A new shoes for Friday party',
      count: 2,
      costPerItem: 200,
      total: Transaction.calcTotal(200, 2),
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Hrx shoes',
      description: 'A new shoes for Friday party',
      count: 2,
      costPerItem: 1250,
      total: Transaction.calcTotal(1250, 2),
      date: DateTime.now(),
    ),
  ];
  final List<int> console = [1, 2, 3, 4, 5, 6, 7];
  String titleInp;
  String descriotionInp;
  int countInp;
  int costPerItemInp;
  DateTime dateInp;

  MyHomePage(this.title, this._changeTheme);

  Future<void> _addNew(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Transactions'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp(
                        "(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff]|[0-9A-Za-z])")),
                  ],
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Woodland Wallet',
                    labelText: 'Name of item',
                  ),
                  onChanged: (String value) {
                    titleInp = value;
                  },
                ),
                TextField(
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp(
                        "(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff]|[0-9A-Za-z,.])")),
                  ],
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'A new wallet for Dad',
                    labelText: 'Description/Usage of item',
                  ),
                  onChanged: (String value) {
                    descriotionInp = value;
                  },
                ),
                TextField(
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                    signed: false,
                    decimal: false,
                  ),
                  decoration: InputDecoration(
                    hintText: '2',
                    labelText: 'Number of item bought',
                  ),
                  onChanged: (String value) {
                    countInp = int.parse(value);
                  },
                ),
                TextField(
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[0-9.]")),
                  ],
                  keyboardType: TextInputType.numberWithOptions(
                    signed: false,
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    hintText: '1200',
                    labelText: 'Cost per Item',
                  ),
                  onChanged: (String value) {
                    costPerItemInp = int.parse(value);
                  },
                ),
                // TextField(
                //   keyboardType: TextInputType.datetime,
                //   decoration: InputDecoration(
                //     labelText: 'Pick the date and time',
                //   ),
                //   onTap: () {
                //     var date = showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime.now().subtract(Duration(days: 7)),
                //       lastDate: DateTime.now().add(Duration(hours: 1)),
                //     );
                //     var time = showTimePicker(
                //       context: context,
                //       initialTime: TimeOfDay(
                //         hour: 0, minute: 0,
                //       ),
                //     );

                //   },
                //   onChanged: (String value) {
                //     dateInp = DateTime.parse(value);
                //     print(dateInp);
                //   },
                // ),
                FlatButton(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now().subtract(
                        Duration(
                          days: 7,
                        ),
                      ),
                      maxTime: DateTime.now(),
                      onChanged: (date) {
                        print('change $date');
                      },
                      onConfirm: (date) {
                        print('confirm $date');
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.en,
                    );
                  },
                  child: Text(
                    'Date & Time',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
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
