import 'package:dartz/dartz.dart';
import 'package:done_it/core/error/failures.dart';
import 'package:done_it/core/usecases/usecase.dart';
import 'package:done_it/feature/todo/domain/entities/todo.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';


class GetAllTodo implements UseCase<List<Todo>, NoParams> {
  final TodoRepository todoRepository;

  GetAllTodo(this.todoRepository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams noParams) async {
    return await todoRepository.getAllTodo();
  }
}
