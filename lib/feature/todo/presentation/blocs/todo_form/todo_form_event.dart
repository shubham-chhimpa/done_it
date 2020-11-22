part of 'todo_form_bloc.dart';

abstract class TodoFormEvent extends Equatable {
  const TodoFormEvent();

  @override
  List<Object> get props => [];
}

class TodoChanged extends TodoFormEvent {
  const TodoChanged({@required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class TodoUnfocused extends TodoFormEvent {}

class TodoSubmitted extends TodoFormEvent {}
