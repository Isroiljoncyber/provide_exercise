import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/newsDetailedBloc//news_detailed_bloc.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/ui/widgets/bottomNav.dart';
import 'package:provide_exercise/ui/widgets/news_detailed_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_detailed_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';

import '../domain/models/news_detailed_model.dart';
import '../utils/notification.dart';

class NewsDetailedPage extends StatelessWidget {
  NewsDetailedPage(this._newsModel, {Key? key}) : super(key: key);

  final NewsModel _newsModel;
  final Notifications _notifications = Notifications();
  late List<NewsDetailedModel> listNewsDetails = [];

  @override
  Widget build(BuildContext context) {
    context
        .read<NewsDetailedBloc>()
        .add(NewsEventGetMoreDetail(_newsModel.id!));

    // _notifications.pushNotification(_newsModel);
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
      body: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _newsModel.title!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      _newsModel.body!,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  BlocBuilder<NewsDetailedBloc, NewsDetailedState>(
                      builder: (context, state) {
                        if (state is NewsDetailedStateOnCompleted) {
                          listNewsDetails.addAll(state.listNewsDetails);
                          return Flexible(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return NewsDetailedItem(
                                    state.listNewsDetails[index]);
                              },
                            ),
                          );
                        } else if (state is NewsDetailedStateOnFiled) {
                          return const Expanded(
                            child: Center(
                              child: Text("Error"),
                            ),
                          );
                        } else if (state is NewsDetailedStateInProgress) {
                          return Flexible(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return const NewsDetailedShimmerItem();
                              },
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      }),
                ],
              )),
          BottomNav(_newsModel, listNewsDetails: listNewsDetails,),
        ],
      ),
    );
  }
}