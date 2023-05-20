// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;
  TodoFilterState({
    required this.filter,
  });

  factory TodoFilterState.initial(){
    return TodoFilterState(filter: Filter.active);
  }
  
  @override
  // TODO: implement props
  List<Object> get props => [filter];

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  @override
  bool get stringify => true;
}
