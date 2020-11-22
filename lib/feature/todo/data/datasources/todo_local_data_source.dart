import 'package:done_it/feature/todo/data/models/todo_model.dart';

abstract class TodoLocalDataSource {
  ///Throws [DataBaseException] if no data found
  Future<TodoModel> getTodo(int id);

  Future<List<TodoModel>> getAllTodo();

  Future<void> addTodo(TodoModel todoModel);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  TodoLocalDataSourceImpl();

  List<TodoModel> todoModelList = [
    TodoModel(task: 'task1', id: 0),
    TodoModel(task: 'task2', id: 1)
  ];

  @override
  Future<TodoModel> getTodo(int id) {
    return null;
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    return Future.delayed(const Duration(seconds: 3), () => todoModelList);
  }

  @override
  Future<void> addTodo(TodoModel todoModel) {
    return Future.delayed(const Duration(seconds: 3), () {
      todoModelList.add(todoModel);
    });
  }
}
