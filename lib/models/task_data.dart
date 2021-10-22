import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskTitle: 'buy milk'),
    Task(taskTitle: 'buy cat food'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView<Task>(_tasks);
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(taskTitle: taskTitle));
    notifyListeners();
  }

  void checkTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    int index = _tasks.indexOf(task);
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
