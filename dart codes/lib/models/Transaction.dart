import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Transaction extends Equatable {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final DateTime createdOn;


  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
    @required this.createdOn,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      amount,
      date,
      createdOn,
    ];
  }

  Transaction copyWith({
    String id,
    String title,
    double amount,
    DateTime date,
    DateTime createdOn,

  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      createdOn: createdOn ?? this.createdOn,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount.toString(),
      'date': date.millisecondsSinceEpoch,
      'createdOn': createdOn.millisecondsSinceEpoch,

    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      title: map['title'],
      amount: double.tryParse(map['amount']) ?? 0.0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      createdOn: DateTime.fromMillisecondsSinceEpoch(map['createdOn']),

    );
  }

  @override
  bool get stringify => true;
}
