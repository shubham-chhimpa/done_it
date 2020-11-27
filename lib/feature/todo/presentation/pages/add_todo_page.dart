import 'package:done_it/core/presentation/some_went_wrong_page.dart';
import 'package:done_it/feature/todo/presentation/blocs/todo_form/todo_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoPage extends StatefulWidget {
  static const routeName = '/AddTodoPage';

  @override
  State<StatefulWidget> createState() {
    return AddTodoPageState();
  }
}

class AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String _task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                BlocProvider.of<TodoFormBloc>(context).add(
                  TodoFormAddEvent(
                    task: _task,
                  ),
                );
              }
            },
          )
        ],
      ),
      body: BlocBuilder<TodoFormBloc, TodoFormState>(
        builder: (BuildContext context, TodoFormState todoFormState) {
          if (todoFormState is TodoFormInitialState) {
            return _buildBody(context);
          } else if (todoFormState is TodoFormLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (todoFormState is TodoFormAddSuccessState) {
            return _buildBody(context);
          } else if (todoFormState is TodoFormAddFailState) {
            return _buildBody(context);
          }
          return SomeThingWentWrongPage();
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                scrollPadding: EdgeInsets.all(20.0),
                keyboardType: TextInputType.multiline,
                maxLines: 99999,
                autofocus: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) {
                  _task = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
