import 'package:flutter/material.dart';
import 'package:hsenid/models/testModel.dart';
import 'package:hsenid/widget/newTranscation.dart';
import 'package:intl/intl.dart';
class Updatepages extends StatelessWidget {
  final Transcations _transaction;
  const Updatepages({Key key, @required Transcations transaction})
      : _transaction = transaction,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 54.0),
          child: Column(
            children: [
              DetailsRow(title: 'Title:', content: _transaction.title),
              DetailsRow(
                  title: 'Amount:',
                  content:
                  _transaction.amount),
              DetailsRow(
                  title: 'Date:',
                  content:
                  '${DateFormat.yMMMMEEEEd().format(_transaction.date)}'
                  ),
              DetailsRow(
                  title: 'Added:',
                  content:
                  '${DateFormat.yMMMEd().format(_transaction.createDate)} ${DateFormat.jm().format(_transaction.createDate)}'
                  ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final editedTransaction = await showModalBottomSheet(
            context: context,
            builder: (_) => NewTransaction.edit(
              transactionVa: _transaction,
            ),
            isScrollControlled: true,
          );
          if (editedTransaction != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Updatepages(transaction: editedTransaction as Transcations),
              ),
            );
          }
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

/////////////conetent creating
class DetailsRow extends StatelessWidget {
  final String title;
  final String content;

  const DetailsRow({
    Key key,
    @required this.title,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            margin: EdgeInsets.only(right: 8.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              content,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

