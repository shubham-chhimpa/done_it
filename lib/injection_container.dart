import 'package:done_it/feature/todo/data/datasources/todo_local_data_source.dart';
import 'package:done_it/feature/todo/data/respositories/todo_repository_impl.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:done_it/feature/todo/domain/usecases/get_all_todo.dart';
import 'package:done_it/feature/todo/domain/usecases/get_todo.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo/todo_bloc.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo_form/todo_form_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory<TodoBloc>(
        () =>
        TodoBloc(
          todoRepository: TodoRepositoryImpl(
            todoLocalDataSource: sl(),
          ),
        ),
  );

  sl.registerFactory<TodoFormBloc>(
        () => TodoFormBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTodo(sl()));
  sl.registerLazySingleton(() => GetAllTodo(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImpl(todoLocalDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<TodoLocalDataSource>(
          () => TodoLocalDataSourceImpl());

  //! Core

  //! External
}
