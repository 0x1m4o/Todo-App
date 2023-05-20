import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addData(String newDesc) {
    final newTodo = Todo(desc: newDesc);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
  }

  void updateData(String id, String updateDesc) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: updateDesc, completed: true);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void completedData(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        Todo(id: id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeData(Todo removeTodo) {
    final newTodos =
        state.todos.where((Todo todo) => todo.id != removeTodo.id).toList();

    emit(state.copyWith(todos: newTodos));
  }
}
