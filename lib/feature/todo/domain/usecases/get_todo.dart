import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class GetTodo implements UseCase<Todo, Params> {
  final TodoRepository todoRepository;

  GetTodo(this.todoRepository);

  @override
  Future<Either<Failure, Todo>> call(Params params) async {
    return await todoRepository.getTodo(params.id);
  }
}

class Params extends Equatable {
  final int id;

  Params({@required this.id});

  @override
  List<Object> get props => [id];
}
