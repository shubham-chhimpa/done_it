import 'package:dartz/dartz.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:done_it/feature/todo/domain/usecases/get_all_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MockTodoRepository mockTodoRepository;
  GetAllTodo getAllTodo;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    getAllTodo = GetAllTodo(mockTodoRepository);
  });

  final List<Todo> tAllTodo = [
    Todo(
      task: 'task1',
      id: 1,
    ),
    Todo(
      task: 'task2',
      id: 2,
    )
  ];

  test("should get all todo from the repository", () async {
    // arrange
    when(mockTodoRepository.getAllTodo())
        .thenAnswer((_) async => Right(tAllTodo));
    // act
    final result = await getAllTodo(NoParams());
    // assert
    expect(result, Right(tAllTodo));
    verify(mockTodoRepository.getAllTodo());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
