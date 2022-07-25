import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expenses/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';

class NewTrasaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTrasaction(this.addNewTransaction) {
    print("Constructor  Newtransactor Widget");
  }

  @override
  _NewTrasactionState createState() {
    print("create state  Newtransactor Widget");
    return _NewTrasactionState();
  }
}

class _NewTrasactionState extends State<NewTrasaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTrasactionState() {
    print("Constructor  Newtransactor State");
  }

  @override
  void initState() {
    super.initState();
    print("initState  Newtransactor State");
  }

  @override
  void didUpdateWidget(covariant NewTrasaction oldWidget) {
    print('did update widge');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("Dispose  Newtransactor State");
    super.dispose();
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    final selectedDate = _selectedDate == null ? DateTime.now() : _selectedDate;
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
      selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (value) => _submitData(),
                // onChanged: (value) {titleInput = value;},
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (value) => _submitData(),
                // onChanged: (value) {amountInput = double.parse(value);},
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveFlatButton('Choose Date', _presentDatePicker)
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () {
                  // print(titleInput);
                  // print(amountInput);
                  _submitData();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
