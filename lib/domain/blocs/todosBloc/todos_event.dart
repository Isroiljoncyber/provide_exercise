part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class GetTodosEvent extends TodosEvent {
  @override
  List<Object?> get props => [];
}
