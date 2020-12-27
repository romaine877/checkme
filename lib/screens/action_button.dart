import 'package:flutter/material.dart';
import 'package:todoey/constants/constants.dart';

class ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Container(
        color: Colors.blue[300],
        child: Container(
child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.add, color: Colors.white,),
    SizedBox(width: 10,),
    Text("Add a task", style: textStyle3,)
  ],
),
        ),
      ),
    );
  }
}
