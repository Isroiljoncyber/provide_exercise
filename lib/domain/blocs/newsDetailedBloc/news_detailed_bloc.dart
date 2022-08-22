import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provide_exercise/domain/models/news_detailed_model.dart';
import 'package:provide_exercise/utils/constants.dart';


part 'news_detailed_event.dart';

part 'news_detailed_state.dart';

class NewsDetailedBloc extends Bloc<NewsDetailedEvent, NewsDetailedState> {
  NewsDetailedBloc() : super(NewsDetailedInitial()) {
    on<NewsEventGetMoreDetail>((event, emit) async {
      try {
        emit(const NewsDetailedStateInProgress());
        List<NewsDetailedModel> commentsList = [];
        var response = await get(Uri.parse("${baseUrl}comments"));
        if (response.statusCode == 200) {
          for (var item in jsonDecode(response.body)) {
            var model = NewsDetailedModel.fromJson(item);
            if (event.id == model.postId) {
              commentsList.add(model);
            }
          }
          emit(NewsDetailedStateOnCompleted(commentsList));
        } else {
          emit(const NewsDetailedStateOnFiled("Respond error"));
        }
      } on SocketException {
        emit(const NewsDetailedStateOnFiled("Socket error"));
      } catch (e) {
        emit(NewsDetailedStateOnFiled(e.toString()));
      }
    });
  }
}
