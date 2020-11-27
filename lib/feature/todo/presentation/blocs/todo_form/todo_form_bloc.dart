import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:done_it/feature/todo/domain/usecases/add_todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'todo_form_event.dart';

part 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc({@required this.addTodo})
      : super(TodoFormInitialState()) {
    print("TodoFormBloc : constructor");
  }

  final AddTodo addTodo;

  @override
  Stream<TodoFormState> mapEventToState(
      TodoFormEvent event,
      ) async* {
    if (event is TodoFormAddEvent) {
      yield TodoFormLoadingState();
      final todoAddedFailedOrSuccess =
      await addTodo(Params(task: event.task));
      yield todoAddedFailedOrSuccess.fold(
            (l) => TodoFormAddFailState(),
            (r) => TodoFormAddSuccessState(),
      );
    }
  }

  @override
  void onTransition(Transition<TodoFormEvent, TodoFormState> transition) {
    print("TodoFormBloc : $transition");
    super.onTransition(transition);
  }
}
