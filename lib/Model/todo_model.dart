import 'package:flutter/cupertino.dart';

class ToDoModel {
  String? id;
  String? title;

  bool? isDone;

  ToDoModel({required this.id, required this.title, this.isDone = false});

  static List<ToDoModel> allToDoList() {
    return [
      ToDoModel(id: '1', title: 'Aabis'),
      ToDoModel(id: '2', title: 'Ahmed', isDone: true),
      ToDoModel(id: '3', title: 'Hassan', isDone: false),
      ToDoModel(id: '4', title: 'Aabis', isDone: true),
      ToDoModel(id: '5', title: 'Ahmed', isDone: false),
      ToDoModel(id: '6', title: 'Hassan'),
      ToDoModel(id: '7', title: 'Hassan', isDone: false),
      ToDoModel(id: '8', title: 'Hassan', isDone: true),
      ToDoModel(id: '9', title: 'Hassan'),
    ];
  }
}
