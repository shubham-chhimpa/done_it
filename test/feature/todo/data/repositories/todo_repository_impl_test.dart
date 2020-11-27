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

    test(
        "should return todo data when the call to local data source is success",
            () async {
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

  group("getAllTodo", () {
    final List<TodoModel> tAllTodoModel = [
      TodoModel(
        task: 'task1',
        id: 1,
      ),
      TodoModel(
        task: 'task2',
        id: 2,
      )
    ];
    test("should return list of todo when call to local database is successful",
            () async {
          // arrange
          when(mockLocalDataSource.getAllTodo())
              .thenAnswer((realInvocation) async => tAllTodoModel);
          // act
          final result = await todoRepositoryImpl.getAllTodo();
          // assert
          expect(result, Right(tAllTodoModel));
        });

    test("should return Database failure when call to database is unsuccessful",
            () async {
          // arrange
          when(mockLocalDataSource.getAllTodo()).thenThrow(DataBaseException());
          // act
          final result = await todoRepositoryImpl.getAllTodo();
          // assert
          verify(mockLocalDataSource.getAllTodo());
          expect(result, Left(DataBaseFailure()));
        });
  });

  group("addTodo", () {
    final tId = 1;
    String tTask = 'test';
    final tTodo = TodoModel(task: tTask, id: tId);

    test("should return new added todo when call to local database is successful",
            () async {
          // arrange
          when(mockLocalDataSource.addTodo(tTask))
              .thenAnswer((realInvocation) async => tTodo);
          // act
          final result = await todoRepositoryImpl.addTodo(tTask);
          // assert
          expect(result, Right(tTodo));
        });

    test("should return Database failure when call to database is unsuccessful",
            () async {
          // arrange
          when(mockLocalDataSource.addTodo(any)).thenThrow(DataBaseException());
          // act
          final result = await todoRepositoryImpl.addTodo(tTask)  ;
          // assert
          verify(mockLocalDataSource.addTodo(tTask));
          expect(result, Left(DataBaseFailure()));
        });
  });
}
