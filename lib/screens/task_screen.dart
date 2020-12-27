import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants/constants.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/action_button.dart';
import 'package:todoey/screens/action_modal.dart';
import 'package:todoey/views/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: Colors.transparent, child: Container( child: Image.asset("assets/check.png", fit: BoxFit.contain,))),
            SizedBox(
              width: 10,
            ),
            Text(
              'CheckMe',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You currently have ${Provider.of<TaskData>(context).taskCount} tasks',
                  style: textStyle2,
                ),
              ],
            ),
          ),
          TaskList(),
          GestureDetector(
              child: ActionButton(),
              onTap: () {
                showModalBottomSheet(
                  barrierColor: Color(0x01000000),
                  backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return ActionModal();
                    });
              }),
        ]),
      ),
    );
  }
}
