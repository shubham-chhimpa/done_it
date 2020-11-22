import 'package:done_it/feature/todo/presentation/blocs/todo/todo_bloc.dart';
import 'package:done_it/feature/todo/presentation/pages/add_todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class TodoHomePage extends StatelessWidget {
  static const routeName = '/TodoHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => sl<TodoBloc>()..add(GetTodoListEvent()),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (BuildContext context, TodoState state) {
            if (state is TodoInitialState) {
              return Center(
                child: Text("Initial State"),
              );
            } else if (state is TodoLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TodoLoadSuccess) {
              return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index].task),
                  );
                },
              );
            } else if (state is TodoLoadFailed) {
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          Navigator.pushNamed(context, AddTodoPage.routeName);
        },
      ),
    );
  }
}
