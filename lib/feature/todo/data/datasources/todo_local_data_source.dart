import 'package:done_it/core/error/exceptions.dart';
import 'package:done_it/feature/todo/data/models/todo_model.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';

abstract class TodoLocalDataSource {
  ///Throws [DataBaseException] if no data found
  Future<TodoModel> getTodo(int id);

  Future<List<TodoModel>> getAllTodo();

  Future<Todo> addTodo(String task);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  TodoLocalDataSourceImpl();

  // This is a dummy in memory data source to mock a local database
  List<TodoModel> todoModelList = [
    TodoModel(
        task:
        'This is a very long to be done by me! I have to develop ViewTodoPage and edit todo page. Then i have to develop delete todo function. This is a very long to be done by me! I have develop view todo page and edit todo page. then i have tp develop delete todo function',
        id: 0),
    TodoModel(task: 'task2', id: 1),
    TodoModel(task: 'task3', id: 2),
    TodoModel(task: 'task4', id: 3)
  ];

  @override
  Future<TodoModel> getTodo(int id) {
    final TodoModel todoModel = todoModelList
        .firstWhere((element) => element.id == id, orElse: () => null);
    if (todoModel != null) {
      return Future.delayed(const Duration(seconds: 1), () => todoModel);
    } else {
      throw DataBaseException();
    }
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    return Future.delayed(const Duration(seconds: 1), () => todoModelList);
  }

  @override
  Future<Todo> addTodo(String task) {
    return Future.delayed(const Duration(seconds: 1), () {
      final Todo todo = TodoModel(task: task, id: todoModelList.length);
      todoModelList.add(todo);
      return todo;
    });
  }
}
