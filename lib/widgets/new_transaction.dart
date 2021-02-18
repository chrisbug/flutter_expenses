import 'package:flutter/material.dart';

class NewTrasaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;
  NewTrasaction(this.addNewTransaction);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addNewTransaction(
                  enteredTitle,
                  enteredAmount,
                );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (value) => submitData(),
              // onChanged: (value) {titleInput = value;},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal:true),
              onSubmitted: (value) => submitData(),
              // onChanged: (value) {amountInput = double.parse(value);},
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.blue,
              onPressed: () {
                // print(titleInput);
                // print(amountInput);
                submitData();
              },
            )
          ],
        ),
      ),
    );
  }
}
