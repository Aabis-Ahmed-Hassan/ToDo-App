import 'package:flutter/material.dart';
import 'package:to_do_app/Constants/colors.dart';
import 'package:to_do_app/Model/todo_model.dart';

class ToDoItem extends StatefulWidget {
  ToDoItem(
      {super.key,
      required this.myToDoObject,
      required this.onCheckboxChange,
      required this.onDelete});

  ToDoModel myToDoObject;

  final onCheckboxChange;
  final onDelete;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  bool userChoice = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        onTap: () {

          widget.onCheckboxChange(widget.myToDoObject);

        },
        leading: Icon(
          widget.myToDoObject.isDone!
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          color: AppColors.tdBlue,
          size: 26,
        ),
        title: Text(
          widget.myToDoObject.title.toString(),
          style: TextStyle(
            color: AppColors.tdBlack,
            fontSize: 16,
            decoration:
                widget.myToDoObject.isDone! ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: InkWell(
          onTap: () {
            widget.onDelete(widget.myToDoObject.id);
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.tdRed,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
