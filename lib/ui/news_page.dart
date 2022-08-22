import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/ui/widgets/news_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';

import '../domain/blocs/newsBloc/news_bloc.dart';
import '../domain/models/news_model.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);
  late List<NewsModel> listNews = [];

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(const NewsEventGetPosts());
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
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsStateOnCompleted) {
            listNews = state.listNews;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: listNews.length,
              itemBuilder: (context, index) {
                return NewsItem(listNews[index]);
              },
            );
          } else if (state is NewsStateOnFiled) {
            return const Expanded(
              child: Center(
                child: Text("Error"),
              ),
            );
          } else if (state is NewsStateInProgress) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const NewsShimmerItem();
              },
            );
          } else {
            // context.read<NewsBloc>().add(const NewsEventGetPosts());
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
