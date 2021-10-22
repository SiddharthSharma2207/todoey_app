import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTask extends StatelessWidget {
  String taskTitle = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 25, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: controller,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(hintText: 'Type here'),
              onChanged: (value) {
                taskTitle = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
                onPressed: () {
                  //addButtonCallBack(taskTitle);
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(taskTitle);
                  controller.clear();
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      ),
    );
  }
}
