import 'package:flutter/material.dart';
import 'package:hsenid/budget/budgetBody.dart';

class BudgetMain extends StatefulWidget {
  @override
  _BudgetMainState createState() => _BudgetMainState();
}

class _BudgetMainState extends State<BudgetMain> {
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
        child: BudegetBody(),
      ),

    );
  }
}
