import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({this.todoRepository}) : super(TodoInitialState());
  final TodoRepository todoRepository;

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is AddTodoEvent) {
      yield TodoLoadingState();
      final todoAddedFailedOrSuccess = await todoRepository.addTodo(event.todo);
      yield todoAddedFailedOrSuccess.fold(
            (l) => TodoAddFailed(),
            (r) => TodoAddSuccess(),
      );
    } else if (event is GetTodoListEvent) {
      yield TodoLoadingState();
      final todoListFailedOrSuccess = await todoRepository.getAllTodo();
      yield todoListFailedOrSuccess.fold(
            (l) => TodoLoadFailed(),
            (r) => TodoLoadSuccess(todoList: r),
      );
    }
  }
}
