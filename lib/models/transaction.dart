import 'package:flutter/foundation.dart';

class Transaction {
  final String id, title, description;
  final int count;
  final double costPerItem, total;
  final DateTime date;

  Transaction({
    @required @required this.id,
    @required @required this.title,
    @required this.description,
    @required this.count,
    @required this.costPerItem,
    this.total,
    @required this.date,
  });
  // using named arguments so that we don't have to remember positions in constructor

  static double calcTotal(costPerItem, count) {
    return costPerItem * count.toDouble();
  }
}
