import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/usecases/add_todo.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo_form/todo_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_form_bloc_test.mocks.dart';

@GenerateMocks([AddTodo])
void main() {
  // ignore: close_sinks
  late TodoFormBloc todoFormBloc;
  late MockAddTodo mockAddTodo;
  setUp(() {
    mockAddTodo = MockAddTodo();
    todoFormBloc = TodoFormBloc(addTodo: mockAddTodo);
  });

  test("initial state should be TodoFormInitialState", () async {
    // assert
    expect(todoFormBloc.state, equals(TodoFormInitialState()));
  });
  group("TodoFormAddEvent", () {
    final String tTask = 'test';
    final Todo tTodo = Todo(task: tTask, id: 1);

    test("should add todo when there is a call to AddTodo use case", () async {
      // arrange
      when(mockAddTodo(any)).thenAnswer((realInvocation) async => Right(tTodo));
      // act
      todoFormBloc.add(TodoFormAddEvent(task: tTask));
      await untilCalled(mockAddTodo(Params(task: tTask)));
      // assert
      verify(mockAddTodo(Params(task: tTask)));
    });

    test(
        "should emit [TodoFormLoadingState,TodoFormAddSuccessState] when data is added successfully",
        () async {
      // arrange
      when(mockAddTodo(any)).thenAnswer((realInvocation) async => Right(tTodo));
      // assert later
      final expected = [
        TodoFormLoadingState(),
        TodoFormAddSuccessState(),
      ];
      expectLater(todoFormBloc.stream, emitsInOrder(expected));
      // act
      todoFormBloc.add(TodoFormAddEvent(task: tTask));
    });

    test(
        "should emit [TodoFormLoadingState,TodoFormAddFailState] when data failed to add",
        () async {
      // arrange
      when(mockAddTodo(any))
          .thenAnswer((realInvocation) async => Left(DataBaseFailure()));
      // assert later
      final expected = [
        TodoFormLoadingState(),
        TodoFormAddFailState(),
      ];
      expectLater(todoFormBloc.stream, emitsInOrder(expected));
      // act
      todoFormBloc.add(TodoFormAddEvent(task: tTask));
    });
  });
}
