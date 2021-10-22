import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {@required this.taskTitle,
      required this.isChecked,
      required this.checkBoxCallBack,
      required this.longPressCallBack});
  final taskTitle;
  final bool isChecked;
  final Function(bool?) checkBoxCallBack;
  final void Function() longPressCallBack;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: longPressCallBack,
      child: CheckboxListTile(
          activeColor: Colors.lightBlueAccent,
          title: Text(
            taskTitle,
            style: TextStyle(
                fontSize: 20,
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
          value: isChecked,
          onChanged: checkBoxCallBack),
    );
  }
}

// class TaskTile extends StatefulWidget {
//   TaskTile({required this.itemname});
//   final String itemname;
//   @override
//   _TaskTileState createState() => _TaskTileState();
// }
//
// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false;
//   void checkBoxCallback(bool? checkBoxState) {
//     setState(() {
//       isChecked = checkBoxState!;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         widget.itemname,
//         style: TextStyle(
//             decoration: isChecked ? TextDecoration.lineThrough : null),
//       ),
//       trailing: TaskCheckBox(
//         checkBoxState: isChecked,
//         toggleCheckBoxState: checkBoxCallback,
//       ),
//     );
//   }
// }
//
class TaskCheckBox extends StatelessWidget {
  TaskCheckBox(
      {required this.checkBoxState, required this.toggleCheckBoxState});
  final bool checkBoxState;
  final Function(bool?) toggleCheckBoxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: checkBoxState,
        onChanged: (value) => toggleCheckBoxState(value));
  }
}
