import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';

import '../../../utils/constants.dart';

part 'todos_event.dart';

part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosStateInitial()) {
    on<GetTodosEvent>((event, emit) async {
      try {
        List<TodosModel> todosList = [];
        emit(TodosStateInProgress());
        var response = await get(Uri.parse("${baseUrl}todos"));
        if (response.statusCode == 200) {
          for (var item in jsonDecode(response.body)) {
            var model = TodosModel.fromJson(item);
            todosList.add(model);
          }
          emit(TodosStateOnCompleted(todosList));
        } else {
          emit(TodosStateOnFiled("Respond error: ${response.statusCode}"));
        }
      } on SocketException {
        emit(TodosStateOnFiled("Socket error"));
      } catch (e) {
        emit(TodosStateOnFiled(e.toString()));
      }
    });
  }
}
