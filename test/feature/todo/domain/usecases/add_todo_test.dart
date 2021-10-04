import 'package:dartz/dartz.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:done_it/feature/todo/domain/usecases/add_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_todo_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoRepository mockTodoRepository;
  late AddTodo addTodo;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    addTodo = AddTodo(mockTodoRepository);
  });

  final String tTask = "task";
  final Todo tTodo = Todo(task: tTask, id: 1);
  test("should add todo to the repository", () async {
    // arrange
    when(mockTodoRepository.addTodo(any))
        .thenAnswer((realInvocation) async => Right(tTodo));
    // act
    final result = await addTodo(Params(task: tTask));
    // assert
    expect(result, equals(Right(tTodo)));
  });
}
