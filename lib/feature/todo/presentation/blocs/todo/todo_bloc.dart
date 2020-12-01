import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/usecases/get_all_todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({@required this.getAllTodo}) : super(TodoInitialState());

  final GetAllTodo getAllTodo;

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodoListEvent) {
      print("GetTodoListEvent : called");
      yield TodoLoadingState();
      final todoListFailedOrSuccess = await getAllTodo(NoParams());
      yield todoListFailedOrSuccess.fold(
            (l) => TodoLoadFailedState(),
            (r) => TodoLoadSuccessState(todoList: r),
      );
    }
  }

  @override
  void onTransition(Transition<TodoEvent, TodoState> transition) {
    print("TodoBloc : $transition");
    super.onTransition(transition);
  }
}
