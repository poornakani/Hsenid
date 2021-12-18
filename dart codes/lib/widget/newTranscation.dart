import 'package:flutter/material.dart';
import 'package:hsenid/connections/connection.dart';
import 'package:hsenid/models/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:hsenid/models/testModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//creating states
enum NewTransactionState {
  edit,
  add,
  delete,
}

class NewTransaction extends StatefulWidget {
  final NewTransactionState state;
  final Transaction transaction;
  final Transcations transactionVa;

  NewTransaction.add({
    Key key,
  })  : this.state = NewTransactionState.add,
        this.transaction = null,
  this.transactionVa=null,
        super(key: key);

  NewTransaction.edit({
    Key key,
    @required this.transactionVa,
  })  : this.state = NewTransactionState.edit,
        this.transaction=null,
        super(key: key);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _pickedDate;

  void _startDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.parse("2020-01-01 00:00:01Z"),
        lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      _pickedDate = value;
      _dateController.text = DateFormat.yMMMd().format(_pickedDate);
    });
  }
  //////////////////////////////upload data to transaction model
  void submitingData(){
    if(!_formKey.currentState.validate()){
      return;
    }
    else{
      final transaction = Transaction(
        id: widget.state == NewTransactionState.add
            ? Uuid().v4()
            : widget.transaction.id,
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        date: _pickedDate,
        createdOn: DateTime.now(),
      );
      String v1 =widget.state == NewTransactionState.add
          ? Uuid().v4()
          : widget.transaction.id;
      String v2 =_titleController.text.toString();
      String v3 = double.parse(_amountController.text).toString();
      String v4 = _pickedDate.toString();
      String v5 =DateTime.now().toString();

      if(widget.state == NewTransactionState.add){
        fan_predict(v1,v2,v3,v4,v5);
        Navigator.of(context).pop(transaction);
       // Fetchtransction();
      }
      else{

      }

      // Future<String> fan_predict(String id,String title, String amount, String date, String create) async {
      //   String v1 =id;
      //   String v2 =title;
      //   String v3 = amount;
      //   String v4 = date;
      //   String v5 = create;
      //   print(v1);
      //   print(v2);
      //   print(v3);
      //   print(v4);
      //   print(v5);
      //   final response = await http.post(Uri.parse('http://192.168.8.164:3302/trans/addTransipconfig'),
      //       headers: <String, String>{
      //         'Content-Type': 'application/json; charset=UTF-8',
      //       },
      //       body: jsonEncode(<String, String>{
      //         "id": v1,
      //         "title": v2,
      //         "amount": v3,
      //         "date": v4,
      //         "createDate": v5
      //       }));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        elevation: 8,
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    prefixText: "Rs",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  onFieldSubmitted: (_) => _startDatePicker(),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Amount cannot be empty';
                    }
                    final price = double.tryParse(value);
                    if (price == null) {
                      return 'Please enter numbers only';
                    }
                    if (price <= 0) {
                      return 'Price must be greater than 0';
                    }
                    if (price >= 1000000) {
                      return 'Price must be less than 100,00,00';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          decoration: InputDecoration(labelText: 'Date'),
                          enableInteractiveSelection: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please pick a date';
                            }
                            return null;
                          },
                        ),
                      ),
                      FlatButton(
                        onPressed: _startDatePicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    FlatButton(
                      onPressed: (){submitingData();

                      },
                      child: Text(
                        widget.state == NewTransactionState.add
                            ? 'Add Transaction'
                            : 'Update',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
