part of 'todos_bloc.dart';

@immutable
abstract class TodosState extends Equatable {}

class TodosStateInitial extends TodosState {
  TodosStateInitial();

  @override
  List<Object?> get props => [];
}

class TodosStateInProgress extends TodosStateInitial {
  TodosStateInProgress();

  @override
  List<Object?> get props => [];
}

class TodosStateOnCompleted extends TodosStateInitial {
  TodosStateOnCompleted(this.listTodos);

  final List<TodosModel> listTodos;

  @override
  List<Object?> get props => [listTodos];
}

class TodosStateOnFiled extends TodosStateInitial {
  TodosStateOnFiled(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
