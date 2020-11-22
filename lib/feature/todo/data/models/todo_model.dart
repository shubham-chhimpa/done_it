import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:flutter/cupertino.dart';

class TodoModel extends Todo {
  TodoModel({
    @required String task,
    @required int id,
  }) : super(id: id, task: task);
}
