import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> _transaction = [
    Transaction(
      id: 't1',
      title: 'Eggs',
      amount: 60.23,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Grossery',
      amount: 44.23,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final txData = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _transaction.add(txData);
    });
  }

  _startNewTransaction(BuildContext ctx) {
    try {
      // return showModalBottomSheet(
      //   context: context,
      //   builder: (_) {
      //     return GestureDetector(
      //       onTap: () {},
      //       behavior: HitTestBehavior.opaque,
      //       child: NewTransaction(
      //         addtx: _addNewTransaction,
      //       ),
      //     );
      //   },
      // );
      return showModalBottomSheet(
        context: ctx,
        builder: (BuildContext context) => GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(addtx: _addNewTransaction),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Expense Tracker',
          ),
          actions: [
            IconButton(
              onPressed: () => _startNewTransaction(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Colors.blue,
                child: Container(
                  child: Text('Hello world'),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 30,
                ),
                elevation: 5,
              ),
              TransactionList(transaction: _transaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startNewTransaction(context),
          ),
        ),
      ),
    );
  }
}
