import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task_model.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _taskList = [
    Task(title: 'food'),
    Task(title: 'clothes'),
    Task(title: 'water'),
    Task(
      title: 'health',
    ),
    Task(title: 'money'),
    Task(title: 'relevance'),
    Task(
      title: 'happiness',
    ),
  ];

  int get taskCount {
    return _taskList.length;
  }

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addNewTask(String newTaskTitle) {
    Task newTask = Task(title: newTaskTitle);
    _taskList.add(newTask);
    notifyListeners();
  }

  void removeTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleSelected();
    notifyListeners();
  }

  void updateFavorite(Task task) {
    task.toggleisFavored();
    sortList();
    notifyListeners();
  }

  void sortList() {
    _taskList.sort((a, b) {
      if (b.isFavorite) {
        return 1;
      }
      return -1;
    });
    print(_taskList);
  }
}
