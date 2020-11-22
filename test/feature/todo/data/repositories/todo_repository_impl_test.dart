import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/exceptions.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/feature/todo/data/datasources/todo_local_data_source.dart';
import 'package:done_it/feature/todo/data/models/todo_model.dart';
import 'package:done_it/feature/todo/data/respositories/todo_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLocalDataSource extends Mock implements TodoLocalDataSource {}

void main() {
  MockLocalDataSource mockLocalDataSource;
  TodoRepositoryImpl todoRepositoryImpl;
  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    todoRepositoryImpl =
        TodoRepositoryImpl(todoLocalDataSource: mockLocalDataSource);
  });

  group("getTodo", () {
    final tId = 1;
    final tTodoModel = TodoModel(task: 'test', id: tId);

    final tTodo = tTodoModel;

    test("should return todo data when local data source is success", () async {
      // arrange
      when(mockLocalDataSource.getTodo(any))
          .thenAnswer((_) async => tTodoModel);
      // act
      final result = await todoRepositoryImpl.getTodo(tId);
      // assert
      verify(mockLocalDataSource.getTodo(tId));
      expect(result, Right(tTodo));
    });

    test("should return Database failure when call to database is unsuccessful",
            () async {
          // arrange
          when(mockLocalDataSource.getTodo(any)).thenThrow(DataBaseException());
          // act
          final result = await todoRepositoryImpl.getTodo(tId);
          // assert
          verify(mockLocalDataSource.getTodo(tId));
          expect(result, Left(DataBaseFailure()));
        });
  });
}
