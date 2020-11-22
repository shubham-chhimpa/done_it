import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'todo_form_event.dart';

part 'todo_form_state.dart';

class TodoFormBloc extends Bloc<TodoFormEvent, TodoFormState> {
  TodoFormBloc() : super(TodoFormInitialState());

  @override
  Stream<TodoFormState> mapEventToState(
      TodoFormEvent event,
      ) async* {
  }
}
