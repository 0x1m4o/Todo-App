// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/cubits/todo_filter/todo_filter_cubit.dart';

import 'package:todo_app_bloc/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_bloc/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

part 'filter_todo_state.dart';

class FilterTodoCubit extends Cubit<FilterTodoListState> {
  List<Todo> initialTodoCubit;

  // In here we make the parameters so we can use the value later
  FilterTodoCubit({
    required this.initialTodoCubit,
  }) : super(FilterTodoListState(todos: initialTodoCubit));

  void setFilteredTodo(Filter filter, List<Todo> todos, String searchTerm) {
    // Created a new list of Todo to overrides the todoList
    List<Todo> filteredTodo;
    // Created a switch case for different filter.
    switch (filter) {
      // If the Filter tab is 'active'.
      case Filter.active:
        // We filter out the todo that do not completed
        filteredTodo = todos.where((Todo todos) => !todos.completed).toList();
        break;

      // If the Filter tab is 'completed'.
      case Filter.completed:
        // We filter out the todo that completed
        filteredTodo = todos.where((Todo todos) => todos.completed).toList();
        break;

      // If the Filter tab is 'all'.
      // We include all of todo list.
      case Filter.all:
      default:
        filteredTodo = todos;
        break;
    }

    // After that we make sure that is textfield is not empty. If it is not empty. We filter again based on the value on the textfields.
    if (searchTerm.isNotEmpty) {
      filteredTodo = filteredTodo
          .where((Todo todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(todos: filteredTodo));
  }
}
