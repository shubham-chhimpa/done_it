import 'package:done_it/feature/setting/presentation/pages/setting_page.dart';
import 'package:done_it/feature/todo/presentation/pages/add_todo_page.dart';
import 'package:done_it/feature/todo/presentation/pages/todo_home_page.dart';
import 'package:done_it/feature/todo/presentation/pages/view_todo_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == AddTodoPage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return AddTodoPage();
        },
      );
    }

    if (settings.name == TodoHomePage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return TodoHomePage();
        },
      );
    }

    if (settings.name == SettingPage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return SettingPage();
        },
      );
    }

    if (settings.name == ViewTodoPage.routeName) {
      final ViewTodoPageArguments viewTodoPageArguments = settings.arguments;
      return MaterialPageRoute(
        builder: (context) {
          return ViewTodoPage(
            key: ValueKey(viewTodoPageArguments.todoModel.id),
            todoModel: viewTodoPageArguments.todoModel,
          );
        },
      );
    }

    assert(false, 'Need to implement ${settings.name}');
    return null;
  }
}
