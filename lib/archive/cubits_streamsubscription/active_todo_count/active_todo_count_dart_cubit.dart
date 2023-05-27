import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_cubit/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_cubit/models/todo_model.dart';

part 'active_todo_count_dart_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  // First we create another cubit so we can use this later.
  final TodoListCubit todoListCubit;

  final int activeTodoCubit;

  // After that we create a stream subscription variable so we can cancel if we don't need it again
  late final StreamSubscription todoStreamSubscription;

  // Ask the TodoListCubit as parameter so we can use the value later.
  ActiveTodoCountCubit(
      {required this.activeTodoCubit, required this.todoListCubit})
      : super(ActiveTodoCountState(activeTodoCount: activeTodoCubit)) {
    // We listen the todo list stream and filter the value completed only
    todoStreamSubscription = todoListCubit.stream.listen((TodoListState todo) {
      final int activeCurrentTodo =
          todo.todos.where((value) => !value.completed).toList().length;
      emit(state.copyWith(activeTodoCount: activeCurrentTodo));
    });
  }

  // Cancel it if we don't need it.
  @override
  Future<void> close() {
    todoStreamSubscription.cancel();
    return super.close();
  }
}
