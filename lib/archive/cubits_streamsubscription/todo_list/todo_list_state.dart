// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  // Create a variable of list from 
  // Todo models that we created before
  List<Todo> todos;
  TodoListState({
    required this.todos,
  });

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', desc: 'Flutter'),
      Todo(id: '2', desc: 'Kotlin'),
      Todo(id: '3', desc: 'Java'),
    ]);
  }

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  bool get stringify => true;
}
