import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/bottomNav.dart';
import 'package:provide_exercise/ui/widgets/news_detailed_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_detailed_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';

class NewsDetailedMorePage extends StatelessWidget {
  const NewsDetailedMorePage(this._newsModel, {Key? key}) : super(key: key);

  final NewsModel _newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr2,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appbarClr,
        centerTitle: true,
        title: Text(
          _newsModel.title!,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Consumer<ViewModel>(
          builder: (context, viewModel, child) {
            return Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: viewModel.listNewsDetailed.length,
                itemBuilder: (context, index) {
                  if (viewModel.listNewsDetailed.isNotEmpty) {
                    return NewsDetailedItem(viewModel.listNewsDetailed[index]);
                  } else {
                    return const NewsDetailedShimmerItem();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
