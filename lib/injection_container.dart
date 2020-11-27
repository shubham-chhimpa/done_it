import 'package:done_it/feature/setting/domain/usecases/change_app_theme_mode.dart';
import 'package:done_it/feature/todo/data/datasources/todo_local_data_source.dart';
import 'package:done_it/feature/todo/data/respositories/todo_repository_impl.dart';
import 'package:done_it/feature/todo/domain/repositories/todo_repository.dart';
import 'package:done_it/feature/todo/domain/usecases/add_todo.dart';
import 'package:done_it/feature/todo/domain/usecases/get_all_todo.dart';
import 'package:done_it/feature/todo/domain/usecases/get_todo.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo/todo_bloc.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo_form/todo_form_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feature/setting/data/datasources/setting_local_data_source.dart';
import 'feature/setting/data/respositories/setting_repository_impl.dart';
import 'feature/setting/domain/repositories/setting_repository.dart';
import 'feature/setting/domain/usecases/get_setting.dart';
import 'feature/setting/presentation/blocs/setting/setting_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc

  sl.registerFactory<SettingBloc>(
        () => SettingBloc(getSetting: sl(), changeAppThemeMode: sl()),
  );
  sl.registerFactory<TodoFormBloc>(
        () => TodoFormBloc(addTodo: sl()),
  );
  sl.registerFactory<TodoBloc>(
        () => TodoBloc(
      getAllTodo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetSetting(sl()));
  sl.registerLazySingleton(() => ChangeAppThemeMode(sl()));
  sl.registerLazySingleton(() => GetTodo(sl()));
  sl.registerLazySingleton(() => GetAllTodo(sl()));
  sl.registerLazySingleton(() => AddTodo(sl()));

  // Repository
  sl.registerLazySingleton<SettingRepository>(
        () => SettingRepositoryImpl(settingLocalDataSource: sl()),
  );
  sl.registerLazySingleton<TodoRepository>(
        () => TodoRepositoryImpl(todoLocalDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<SettingLocalDataSource>(
          () => SettingLocalDataSourceImpl());

  sl.registerLazySingleton<TodoLocalDataSource>(
          () => TodoLocalDataSourceImpl());

  //! Core

  //! External
}
