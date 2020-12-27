import 'package:circular_check_box/circular_check_box.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/task_list_model.dart';
import 'package:audioplayers/audio_cache.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TaskData>(
        builder: (context, taskData, child) => ListView.builder(
            //reverse: true,
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return Dismissible(
                background: Container(
                  color: Colors.green,
                  child: Icon(Icons.check),
                ),
                onDismissed: (direction) {
                  taskData.removeTask(taskData.taskList[index]);
                },
                key: UniqueKey(),
                child: Card(
                  elevation: 5,
                  color: taskData.taskList[index].isSelected
                      ? Colors.amberAccent
                      : Colors.white,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 4, bottom: 4),
                  child: ListTile(
                      title: Text(taskData.taskList[index].title,
                          style: TextStyle(
                              decoration: taskData.taskList[index].isSelected
                                  ? TextDecoration.lineThrough
                                  : null)),
                      leading: TaskCheckbox((bool checkboxState) {
                        FlutterBeep.beep();
                        taskData.updateTask(taskData.taskList[index]);
                      }, taskData.taskList[index].isSelected),
                      trailing: IconButton(
                        icon: taskData.taskList[index].isFavorite
                            ? Icon(Icons.favorite, color: Colors.red,)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          // ignore: unnecessary_statements
                          taskData.updateFavorite(taskData.taskList[index]);
                        },
                      )),
                ),
              );
            }),
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function toggleCheckboxState;
  const TaskCheckbox(this.toggleCheckboxState, this.checkboxState);
  @override
  Widget build(BuildContext context) {
    return CircularCheckBox(
        value: checkboxState, onChanged: toggleCheckboxState);
  }
}
