import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({required this.transaction, super.key});
  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return
              // child: Column(
              //   children: transaction.map((tx) {
              Card(
            child: Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: Text(
                      '\$ ${transaction[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction[index].title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transaction[index].date),
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
          //   }).toList(),
          // ),
        },
        itemCount: transaction.length,
      ),
    );
  }
}
