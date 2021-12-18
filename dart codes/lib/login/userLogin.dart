import 'package:flutter/material.dart';
import 'package:hsenid/login/body.dart';

class UserLogin extends StatefulWidget {
  static String routeName = "/user";
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFDAC7).withOpacity(0.9), Color(0xFFE4CDA7)],
          ),
        ),
        child: Body(),
      ),

    );
  }
}
