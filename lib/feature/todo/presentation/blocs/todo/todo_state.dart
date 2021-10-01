part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadSuccessState extends TodoState {
  final List<Todo> todoList;

  TodoLoadSuccessState({required this.todoList});

  @override
  List<Object> get props => [];
}

class TodoLoadFailedState extends TodoState {}
