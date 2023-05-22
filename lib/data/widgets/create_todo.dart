import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/cubits/todo_list/todo_list_cubit.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({super.key});
  final TextEditingController createController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: createController,
      onSubmitted: (String value) {
        if (value.isNotEmpty) {
          BlocProvider.of<TodoListCubit>(context).addData(value);
        }
      },
      decoration: InputDecoration(
        label: Text('Create Task'),
        border: OutlineInputBorder(),
      ),
    );
  }
}
