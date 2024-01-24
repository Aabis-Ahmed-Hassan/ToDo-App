import 'package:flutter/cupertino.dart';

class ToDoModel {
  String? id;
  String? title;

  bool? isDone;

  ToDoModel({required this.id, required this.title, this.isDone = false});

  static List<ToDoModel> allToDoList() {
    return [
         ToDoModel(id: '1', title: 'First ToDo Item'),
    ];
  }
}
