import 'package:done_it/feature/setting/presentation/pages/setting_page.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo/todo_bloc.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo_form/todo_form_bloc.dart';
import 'package:done_it/feature/todo/presentation/pages/add_todo_page.dart';
import 'package:done_it/feature/todo/presentation/pages/view_todo_page.dart';
import 'package:done_it/feature/todo/presentation/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHomePage extends StatelessWidget {
  static const routeName = '/TodoHomePage';

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoFormBloc, TodoFormState>(
      listener: (BuildContext context, TodoFormState todoFormState) {
        if (todoFormState is TodoFormAddSuccessState) {
          context.read<TodoBloc>().add(GetTodoListEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, SettingPage.routeName);
                }),
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, TodoState state) {
            if (state is TodoInitialState) {
              return Center(
                child: Text("Initial State"),
              );
            } else if (state is TodoLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TodoLoadSuccessState) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  itemCount: state.todoList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ViewTodoPage.routeName,
                          arguments: ViewTodoPageArguments(
                            todoModel: state.todoList[index],
                          ),
                        );
                      },
                      child: TodoCard(
                        key: ValueKey(index),
                        todoModel: state.todoList[index],
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              );
            } else if (state is TodoLoadFailedState) {
              return Center(
                child: Text("Error Loading"),
              );
            } else {
              return Center(
                child: Text("Unexpected State"),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: () {
            Navigator.pushNamed(context, AddTodoPage.routeName);
          },
        ),
      ),
    );
  }
}
