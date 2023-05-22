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
  // Another Cubit class
  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;

  // Stream Subscription
  late StreamSubscription todoListStreamSubscription;
  late StreamSubscription todoFilterStreamSubscription;
  late StreamSubscription todoSearchStreamSubscription;

  List<Todo> initialTodoCubit;

  // In here we make the parameters so we can use the value later
  FilterTodoCubit({
    required this.initialTodoCubit,
    required this.todoListCubit,
    required this.todoFilterCubit,
    required this.todoSearchCubit,
  }) : super(FilterTodoListState(todos: initialTodoCubit)) {
    // We created subscription in every cubit stream.
    todoFilterStreamSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      // This used to filter out the list of cubit.
      setFilteredTodo();
    });

    todoListStreamSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      // This used to filter out the list of cubit.
      setFilteredTodo();
    });

    todoSearchStreamSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchCubit) {
      // This used to filter out the list of cubit.
      setFilteredTodo();
    });
  }

  void setFilteredTodo() {
    // Created a new list of Todo to overrides the todoList
    List<Todo> filteredTodo;
    // Created a switch case for different filter.
    switch (todoFilterCubit.state.filter) {
      // If the Filter tab is 'active'.
      case Filter.active:
        // We filter out the todo that do not completed
        filteredTodo = todoListCubit.state.todos
            .where((Todo todos) => !todos.completed)
            .toList();
        break;

      // If the Filter tab is 'completed'.
      case Filter.completed:
        // We filter out the todo that completed
        filteredTodo = todoListCubit.state.todos
            .where((Todo todos) => todos.completed)
            .toList();
        break;

      // If the Filter tab is 'all'.
      // We include all of todo list.
      case Filter.all:
      default:
        filteredTodo = todoListCubit.state.todos;
        break;
    }

    // After that we make sure that is textfield is not empty. If it is not empty. We filter again based on the value on the textfields.
    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodo = filteredTodo
          .where((Todo todo) => todo.desc
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm.toLowerCase()))
          .toList();
    }

    emit(state.copyWith(todos: filteredTodo));
  }

  @override
  Future<void> close() {
    todoFilterStreamSubscription.cancel();
    todoListStreamSubscription.cancel();
    todoSearchStreamSubscription.cancel();
    return super.close();
  }
}
