import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

part 'active_todo_count_dart_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  // First we create another cubit so we can use this later.

  final int initialActiveTodoCount;

  // Ask the TodoListCubit as parameter so we can use the value later.
  ActiveTodoCountCubit({required this.initialActiveTodoCount})
      : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    // We listen the todo list stream and filter the value completed only
  }
  void activeTodoCount(int activeTodoCount) {
    emit(state.copyWith(activeTodoCount: activeTodoCount));
  }
}
