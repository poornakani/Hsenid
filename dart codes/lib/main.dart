import 'package:flutter/material.dart';
import 'package:hsenid/login/userLogin.dart';
import 'package:hsenid/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Management',
      initialRoute: UserLogin.routeName,
      routes: routes,
    );
  }
}
