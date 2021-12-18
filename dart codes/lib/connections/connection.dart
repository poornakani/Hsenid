import 'package:flutter/material.dart';
import 'package:hsenid/models/Transaction.dart';
import 'package:hsenid/models/testModel.dart';
import 'package:hsenid/models/testModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

final List<Transaction> _transactions =[];
final List<Transcations> _transactionss =[];

Future<String> fan_predict(String id,String title, String amount, String date, String create) async {
  String v1 =id;
  String v2 =title;
  String v3 = amount;
  String v4 = date;
  String v5 = create;
  print(v1);
  print(v2);
  print(v3);
  print(v4);
  print(v5);
  final response = await http.post(Uri.parse('http://192.168.8.164:3302/trans/addTrans'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": v1,
        "title": v2,
        "amount": v3,
        "date": v4,
        "createDate": v5
      }));
  var respons = response.body;
  print(respons);
}
//////////////////////////////get data
  Future<List<Transcations>> fetchTrasnscation() async{
  var responses = await http.get(Uri.parse('http://192.168.8.164:3302/trans'));
  ////creating tempary list
    List<Transcations> tList =[];
    if(responses.statusCode==200){
      var JsonData = json.decode(responses.body);

      for(var jsondata in JsonData){
        tList.add(Transcations.fromJson(jsondata));
      }
    }
    return tList;
  }
////////////////////////////delete///////////////////////////////

Future<String> delete_Transcation(String id) async {
  String deleteID = id;
  print(deleteID);
  final response = await http.delete(Uri.parse('http://192.168.8.164:3302/trans/delete'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "id": deleteID,

      }));
  if(response.statusCode==200){
    print("one raw was deleted");
  }
}

