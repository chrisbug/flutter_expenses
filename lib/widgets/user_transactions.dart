import 'package:flutter/material.dart';
// Models
import '../models/transaction.dart';
// Widgets
import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 101.34,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Food',
      amount: 50.50,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount){
    String id = "t${_userTransactions.length + 1}";
    final Transaction newTransaction = Transaction(id: id, title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTrasaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
