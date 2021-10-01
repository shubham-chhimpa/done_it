part of 'todo_form_bloc.dart';

abstract class TodoFormEvent extends Equatable {
  const TodoFormEvent();

  @override
  List<Object> get props => [];
}

class TodoFormAddEvent extends TodoFormEvent {
  final String task;

  TodoFormAddEvent({required this.task});

  @override
  List<Object> get props => [task];
}
