import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // double amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTrasaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _addNewTransaction(String title, double amount) {
    String id = "t${_userTransactions.length + 1}";
    final Transaction newTransaction =
        Transaction(id: id, title: title, amount: amount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fluter app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()  => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
            ),
          ),
          Column(
            children: <Widget>[
              TransactionList(_userTransactions),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _startAddNewTransaction(context),
      ),
    );
  }
}
