import 'package:done_it/feature/todo/presentation/blocs/todo_form/todo_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class AddTodoPage extends StatelessWidget {
  static const routeName = '/AddTodoPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TodoFormBloc>(),
      child: BlocBuilder<TodoFormBloc, TodoFormState>(
        builder: (BuildContext context, TodoFormState todoFormState) {
          return null;
        },
      ),
    );
  }
}

// Create a Form widget.
class TodoForm extends StatefulWidget {
  @override
  TodoFormState createState() {
    return TodoFormState();
  }
}

class TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(border: OutlineInputBorder()),
            maxLines: 5,
            minLines: 5,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
