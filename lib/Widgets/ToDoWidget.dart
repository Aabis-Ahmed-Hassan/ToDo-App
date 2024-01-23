import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  ToDoItem({super.key , required this.title});

  String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(title.toString()),

    );
  }
}
