import 'package:flutter/material.dart';


class Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formKeys = GlobalKey<FormState>();
  String password;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeys,
      child: Column(
        children: <Widget>[
          TextFormField(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Enter User Name",
              hintText: "purna",
            ),
             validator: (value) {
            //   String validateMobile(String value) {
            //     String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
            //     RegExp regExp = new RegExp(pattern);
                if (value.length == null || value.isEmpty) {
                  return 'Please enter User Name';
                } else  {
                  return 'Please enter valid mobile number';
                }
            //     return "done";
            //   }
            },
            //controller: (_),
          ),
          TextFormField(
            obscureText: true,
            //onSaved: ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Enter Your Password",
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
               // removeError(error: kPassNullError);
              } else if (value.length >= 8) {
               // removeError(error: kShortPassError);
              }
              password = value;
            },
            validator: (value) {
              if (value.isEmpty) {
               // addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
               // addError(error: kShortPassError);
                return "";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
