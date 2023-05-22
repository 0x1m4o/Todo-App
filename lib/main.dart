import 'package:flutter/material.dart';
import 'package:todo_app_bloc/cubits/active_todo_count/active_todo_count_dart_cubit.dart';
import 'package:todo_app_bloc/cubits/filter_todo/filter_todo_cubit.dart';
import 'package:todo_app_bloc/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_bloc/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_bloc/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_bloc/pages/todos_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider(
          create: (context) => ActiveTodoCountCubit(
              activeTodoCubit:
                  BlocProvider.of<TodoListCubit>(context).state.todos.length,
              todoListCubit: BlocProvider.of<TodoListCubit>(context)),
        ),
        BlocProvider(
          create: (context) => FilterTodoCubit(
            initialTodoCubit:BlocProvider.of<TodoListCubit>(context).state.todos,
              todoListCubit: BlocProvider.of<TodoListCubit>(context),
              todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
              todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context)),
        )
      ],
      child: MaterialApp(
        home: TodosPage(),
      ),
    );
  }
}
