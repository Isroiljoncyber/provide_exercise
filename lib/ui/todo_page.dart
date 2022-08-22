import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/todosBloc/todos_bloc.dart';
import 'package:provide_exercise/ui/widgets/todos_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/todos_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);
  final String tag = 'todo';

  @override
  Widget build(BuildContext context) {
    context.read<TodosBloc>().add(GetTodosEvent());
    return Scaffold(
      backgroundColor: bgClr2,
      appBar: AppBar(
        backgroundColor: appbarClr,
        centerTitle: true,
        title: const Text(
          "Todos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
        if (state is TodosStateOnCompleted) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: state.listTodos.length,
            itemBuilder: (context, index) {
              return TodosItem(state.listTodos[index]);
            },
          );
        } else if (state is TodosStateInProgress) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return const TodosShimmerItem();
            },
          );
        } else if (state is TodosStateOnFiled) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
