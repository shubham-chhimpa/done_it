import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/usecases/get_all_todo.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo/todo_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetAllTodo extends Mock implements GetAllTodo {}

void main() {
  TodoBloc todoBloc;
  MockGetAllTodo mockGetAllTodo;
  setUp(() {
    mockGetAllTodo = MockGetAllTodo();
    todoBloc = TodoBloc(getAllTodo: mockGetAllTodo);
  });

  test("initial state should be TodoInitialState", () async {
    // assert
    expect(todoBloc.state, equals(TodoInitialState()));
  });

  group("GetTodoListEvent", () {
    final List<Todo> allTodo = [
      Todo(task: 'task1', id: 1),
      Todo(task: 'task2', id: 2),
    ];

    test(
      'should get todo from the getAllTodo use case',
          () async {
        // arrange

        when(mockGetAllTodo(any)).thenAnswer((_) async => Right(allTodo));
        // act
        todoBloc.add(GetTodoListEvent());
        await untilCalled(mockGetAllTodo(any));
        // assert
        verify(mockGetAllTodo(NoParams()));
      },
    );

    test(
      'should emit [TodoLoadingState, TodoLoadSuccessState] when data is gotten successfully',
          () async {
        // arrange
        when(mockGetAllTodo(any)).thenAnswer((_) async => Right(allTodo));
        // assert later
        final expected = [
          TodoLoadingState(),
          TodoLoadSuccessState(todoList: allTodo),
        ];
        expectLater(todoBloc, emitsInOrder(expected));
        // act
        todoBloc.add(GetTodoListEvent());
      },
    );

    test(
      'should emit [TodoLoadingState, TodoLoadFailedState] when getting data fails',
          () async {
        // arrange
        when(mockGetAllTodo(any))
            .thenAnswer((_) async => Left(DataBaseFailure()));
        // assert later
        final expected = [
          TodoLoadingState(),
          TodoLoadFailedState(),
        ];
        expectLater(todoBloc, emitsInOrder(expected));
        // act
        todoBloc.add(GetTodoListEvent());
      },
    );
  });
}
