import 'package:flutter/material.dart';
import 'package:hsenid/models/Transaction.dart';
import 'package:hsenid/widget/transaction_items.dart';


class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList({List<Transaction> transactions, Function deleteTransaction,Fetchtransction()})
      : _transactions = transactions,
        _deleteTransaction = deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == _transactions.length) {
          return SizedBox(height: 75.0);
        }
        if (index != 0 && index % 3 == 0 && _transactions.length > 4) {
          return Column(
            children: [
              TransactionItem(
                  transaction: _transactions[index],
                  deleteTransaction: _deleteTransaction),
            ],
          );
        }
        return TransactionItem(
            transaction: _transactions[index],
            deleteTransaction: _deleteTransaction);
      },
      itemCount: _transactions.length + 1,
    );
  }
}

