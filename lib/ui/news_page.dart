import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/news_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        backgroundColor: appbarClr,
        centerTitle: true,
        title: const Text(
          "News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.listNews.isEmpty) {
            viewModel.getNews();
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount:
                viewModel.listNews.isEmpty ? 10 : viewModel.listNews.length,
            itemBuilder: (context, index) {
              if (viewModel.listNews.isEmpty) {
                return const NewsShimmerItem();
              } else {
                return NewsItem(viewModel.listNews[index]);
              }
            },
          );
        },
      ),
    );
  }
}
