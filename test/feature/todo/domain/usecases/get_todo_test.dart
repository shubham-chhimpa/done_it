import 'package:dartz/dartz.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:done_it/feature/todo/domain/usecases/get_todo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  GetTodo useCase;
  MockTodoRepository mockTodoRepository;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    useCase = GetTodo(mockTodoRepository);
  });

  final tId = 1;
  final tTodo = Todo(task: "todo text", id: tId);
  test("should get Todo for the id from the Repository", () async {
    // arrange
    when(mockTodoRepository.getTodo(any)).thenAnswer((_) async => Right(tTodo));
    // act
    final result = await useCase(Params(id: tId));
    // assert
    expect(result, Right(tTodo));
    verify(mockTodoRepository.getTodo(tId));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
