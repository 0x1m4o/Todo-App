import 'package:flutter/material.dart';
import 'package:todo_app_bloc/data/widgets/create_todo.dart';
import 'package:todo_app_bloc/data/widgets/search_and_filter_todo.dart';
import 'package:todo_app_bloc/data/widgets/show_todo.dart';
import 'package:todo_app_bloc/data/widgets/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(children: [
              TodoHeader(),
              SizedBox(
                height: 10,
              ),
              CreateTodo(),
              SizedBox(
                height: 10,
              ),
              SearchAndFilter(),
              SizedBox(
                height: 10,
              ),
              ShowTodo()
            ]),
          ),
        ),
      ),
    );
  }
}
