// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'filter_todo_cubit.dart';

class FilterTodoListState extends Equatable {
  // Create a variable of list from
  // Todo models that we created before
  final List<Todo> todos;
  FilterTodoListState({
    required this.todos,
  });

  
  // factory FilterTodoListState.initial() {
  //   return FilterTodoListState(todos: []);
  // }

  @override
  List<Object> get props => [todos];

  FilterTodoListState copyWith({
    List<Todo>? todos,
  }) {
    return FilterTodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  bool get stringify => true;
}
