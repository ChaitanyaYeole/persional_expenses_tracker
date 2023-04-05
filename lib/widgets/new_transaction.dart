import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key, required this.addtx});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addtx;

  void addTransaction() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }

    addtx(
      title,
      amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => addTransaction(),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addTransaction,
            ),
            TextButton(
              onPressed: addTransaction,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
