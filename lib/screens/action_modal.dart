import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class ActionModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskTitle;
    String test = "haha  lol   ";
    return SingleChildScrollView(
        child: Container(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Add new Task',
            prefixIcon: CircularCheckBox(value: false, onChanged: null),
          ),
          onSubmitted: (value) {
            taskTitle = value;

            taskTitle = taskTitle.trim();

            taskTitle.isNotEmpty
                ? Provider.of<TaskData>(context, listen: false)
                    .addNewTask(taskTitle)
                : Navigator.canPop(context);
            Navigator.pop(context);
          },
        ),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      ),
    ));
  }
}
