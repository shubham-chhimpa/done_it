import 'package:done_it/core/error/exceptions.dart';
import 'package:done_it/feature/todo/data/datasources/todo_local_data_source.dart';
import 'package:done_it/feature/todo/data/models/todo_model.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TodoLocalDataSourceImpl todoLocalDataSourceImpl;
  setUp(() {
    todoLocalDataSourceImpl = TodoLocalDataSourceImpl();
  });

  group("getTodo", () {
    test("should return todo when there exists with the given id", () async {
      final int tId = 1;
      final TodoModel todoModel = TodoModel(task: 'task2', id: tId);
      // act
      final result = await todoLocalDataSourceImpl.getTodo(tId);
      // assert
      expect(result, todoModel);
    });

    test(
        "should throw Database Exception when there is no todo exists with the given id",
            () async {
          final int tId = 10;
          // act
          final call = todoLocalDataSourceImpl.getTodo;
          // assert
          expect(() => call(tId), throwsA(isInstanceOf<DataBaseException>()));
        });
  });

  group("getAllTodo", () {
    test("should return list of sll todo from local in memory data source",
            () async {
          List<TodoModel> todoModelList = todoLocalDataSourceImpl.todoModelList;
          // act
          final result = await todoLocalDataSourceImpl.getAllTodo();
          // assert
          expect(result, todoModelList);
        });
  });

  group("addTodo", () {
    test("should add a todo and return it from local in memory data source",
            () async {
          final String tTask = "test";
          final int tId = todoLocalDataSourceImpl.todoModelList.length;
          final Todo tTodoModel = TodoModel(task: tTask, id: tId);
          // act
          final result = await todoLocalDataSourceImpl.addTodo(tTask);
          // assert
          expect(result, tTodoModel);
        });
  });
}
