part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoLoadSuccess extends TodoState {
  final List<Todo> todoList;

  TodoLoadSuccess({this.todoList});

  @override
  List<Object> get props => [];
}

class TodoLoadFailed extends TodoState {}
class TodoAddFailed extends TodoState {}
class TodoAddSuccess extends TodoState {}
