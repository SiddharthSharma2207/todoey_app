import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class Task_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            checkBoxCallBack: (bool? checkBoxState) {
              taskData.checkTask(task);
            },
            longPressCallBack: () {
              taskData.deleteTask(task);
            },
            taskTitle: task.taskTitle,
            isChecked: task.isDone,
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
