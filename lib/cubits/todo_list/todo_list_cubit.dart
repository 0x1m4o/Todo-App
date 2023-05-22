import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addData(String newDesc) {
    // Here we create a new Todo member.
    final newTodo = Todo(desc: newDesc);

    // Add the Todo that created before to the all state todo list
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
  }

  void updateData(String id, String updateDesc) {
    // First we need to find from the list the same Id as the clicked one from parameters sends.
    // If it is the same so we can update the value of it.
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(id: id, desc: updateDesc, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void completedData(String id) {
    // Same as Updatedata above, but we make the value of completed reverse.
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        print('Todo ID : ${todo.id}');
        return Todo(id: id, desc: todo.desc, completed: !todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeData(Todo removeTodo) {
    // Where Todo is return to true that todo is in the value
    // But we filter the same id is not inserted/removed from list.
    final newTodos =
        state.todos.where((Todo todo) => todo.id != removeTodo.id).toList();

    emit(state.copyWith(todos: newTodos));
  }
}
