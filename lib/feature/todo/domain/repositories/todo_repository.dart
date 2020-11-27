import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> getTodo(int id);

  Future<Either<Failure, List<Todo>>> getAllTodo();

  Future<Either<Failure, Todo>> addTodo(String task);
}
