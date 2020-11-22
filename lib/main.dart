import 'package:done_it/feature/todo/presentation/pages/add_todo_page.dart';
import 'package:flutter/material.dart';
import 'feature/todo/presentation/pages/todo_home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoHomePage(),
      onGenerateRoute: (settings) {
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
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
