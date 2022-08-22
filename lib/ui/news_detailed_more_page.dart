import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/newsBloc/news_bloc.dart';
import 'package:provide_exercise/ui/widgets/news_detailed_item.dart';

import '../domain/blocs/newsDetailedBloc/news_detailed_bloc.dart';
import '../domain/models/news_detailed_model.dart';
import '../domain/models/news_model.dart';
import '../utils/constants.dart';

class NewsDetailedMorePage extends StatelessWidget {
  const NewsDetailedMorePage(this._newsModel, this.listNewsDetails, {Key? key})
      : super(key: key);

  final NewsModel _newsModel;
  final List<NewsDetailedModel> listNewsDetails;

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
        child: Flexible(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: listNewsDetails.length,
            itemBuilder: (context, index) {
              return NewsDetailedItem(listNewsDetails[index]);
            },
          ),
        ),
      ),
    );
  }
}
