import 'package:flutter/material.dart';
import 'package:hsenid/budget/budgetBody.dart';
import 'package:hsenid/button.dart';
import 'package:hsenid/login/form.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 35,),
                Text("Expense Managment System",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                    //color: splshscreencolor,
                      image: DecorationImage(
                          image: AssetImage("assets/123.png"))),
                ),
                Divider(
                  thickness: 0.9,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                Forms(),
                SizedBox(
                  height: 30,
                ),
                Buttons(
                  text: "Continue",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BudegetBody()));
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14,color: Colors.red),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create New Account ",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    GestureDetector(
                        onTap: () {
                          print("create new account");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Home()));
                        },
                        child: Text(
                          "Sign Up ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.red),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
