import 'package:done_it/feature/todo/data/models/todo_model.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTask = "test";
  final tTodoModel = TodoModel(id: 1, task: tTask);

  test("should be a subclass of Todo", () async {
    // assert
    expect(tTodoModel, isA<Todo>());
  });

  group("getTaskTitle", () {
    test("should return title when length is > 20", () async {
      // arrange
      final tTask = "abcdefghijklmnopqrstuvwxyz";
      final tTitle = "abcdefghijklmnopqrst";
      final tTodoModel = TodoModel(id: 1, task: tTask);

      // act
      final result = tTodoModel.getTaskTitle();
      // assert
      expect(result, equals(tTitle));
    });

    test("should return title when length is < 20", () async {
      // arrange
      final tTask = "abcdefghi";
      final tTitle = tTask;
      final tTodoModel = TodoModel(id: 1, task: tTask);

      // act
      final result = tTodoModel.getTaskTitle();
      // assert
      expect(result, tTitle);
    });
  });

  group("getTaskBodyPreview", () {
    test("should return body preview when length is < 20 ", () async {
      // arrange
      final tTask = "abcdefghijklmnopqrst";
      final tBodyPreview = "";
      final tTodoModel = TodoModel(id: 1, task: tTask);

      // act
      final result = tTodoModel.getTaskBodyPreview();
      // assert
      expect(result, tBodyPreview);
    });

    test("should return body preview when 20 <length <120 ", () async {
      // arrange
      final tTask =
          "abcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrst";
      final tBodyPreview = "abcdefghijklmnopqrstabcdefghijklmnopqrst";
      final tTodoModel = TodoModel(id: 1, task: tTask);

      // act
      final result = tTodoModel.getTaskBodyPreview();
      // assert
      expect(result, tBodyPreview);
    });

    test("should return body preview when length > 120 ", () async {
      // arrange
      final tTask =
          "abcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrstuvwxyz";
      final tBodyPreview =
          "abcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrstabcdefghijklmnopqrst";
      final tTodoModel = TodoModel(id: 1, task: tTask);

      // act
      final result = tTodoModel.getTaskBodyPreview();
      // assert
      expect(result, tBodyPreview);
    });
  });

  test("should return the task from TodoModel", () async {
    // act
    final result = tTodoModel.getTaskFullBody();

    // assert
    expect(result, tTask);
  });
}
