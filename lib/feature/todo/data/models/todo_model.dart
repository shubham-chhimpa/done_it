import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:flutter/material.dart';

class TodoModel extends Todo {
  final String task;
  final int id;

  TodoModel({
    @required this.task,
    @required this.id,
  }) : super(id: id, task: task);

  String getTaskTitle() {
    if (task.length > 20) {
      return task.substring(0, 20);
    } else {
      return task;
    }
  }

  String getTaskBodyPreview() {
    if (task.length > 20) {
      if (task.length > 120) {
        return task.substring(20, 120);
      } else {
        return task.substring(20);
      }
    } else {
      return '';
    }
  }

  String getTaskFullBody() {
    return task;
  }
}
