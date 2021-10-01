import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String task;
  final int id;

  Todo({required this.task, required this.id});

  @override
  List<Object> get props => [task, id];
}
