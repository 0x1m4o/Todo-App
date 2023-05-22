// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'active_todo_count_dart_cubit.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  ActiveTodoCountState({
    required this.activeTodoCount,
  });

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}
