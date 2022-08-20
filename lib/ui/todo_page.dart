import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/alboms_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/alboms_shimmer_item.dart';
import 'package:provide_exercise/ui/widgets/news_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_shimmer_item.dart';
import 'package:provide_exercise/ui/widgets/todos_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/todos_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);
  final String tag = 'todo';

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.getStatus(tag) != StatusModel.isSuccessful) {
            viewModel.getTodos(tag);
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            itemCount:
                viewModel.listTodos.isEmpty ? 20 : viewModel.listTodos.length,
            itemBuilder: (context, index) {
              if (viewModel.getStatus(tag) == StatusModel.isSuccessful) {
                return TodosItem(viewModel.listTodos[index]);
              } else {
                return const TodosShimmerItem();
              }
            },
          );
        },
      ),
    );
  }
}
