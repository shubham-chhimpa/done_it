import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class AddTodo implements UseCase<void, Params> {
  final TodoRepository todoRepository;

  AddTodo(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return todoRepository.addTodo(params.todo);
  }
}

class Params extends Equatable {
  final Todo todo;

  Params({@required this.todo});

  @override
  List<Object> get props => [todo];
}
