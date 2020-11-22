import 'package:done_it/feature/todo/data/models/todo_model.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTodoModel = TodoModel(id: 1,task: "test");

  test("should be a subclass of Todo", () async {
    // assert
    expect(tTodoModel, isA<Todo>());
  });
}
