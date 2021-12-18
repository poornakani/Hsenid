
import 'dart:convert';

class Transcations {
  Transcations({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.createDate,
  });

  String id;
  String title;
  String amount;
  DateTime date;
  DateTime createDate;

  factory Transcations.fromJson(Map<String, dynamic> json) => Transcations(
    id: json["id"],
    title: json["title"],
    amount: json["amount"],
    date: DateTime.parse(json["date"]),
    createDate: DateTime.parse(json["createDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "amount": amount,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "createDate": "${createDate.year.toString().padLeft(4, '0')}-${createDate.month.toString().padLeft(2, '0')}-${createDate.day.toString().padLeft(2, '0')}",
  };
}
