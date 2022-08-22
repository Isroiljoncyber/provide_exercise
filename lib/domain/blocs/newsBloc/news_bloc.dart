import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

import '../../../utils/constants.dart';
import '../../models/news_model.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<NewsEventGetPosts>((event, emit) async {
      try {
        emit(const NewsStateInProgress());
        List<NewsModel> newsList = [];
        var response = await get(Uri.parse("${baseUrl}posts"));
        if (response.statusCode == 200) {
          for (var item in jsonDecode(response.body)) {
            var model = NewsModel.fromJson(item);
            newsList.add(model);
          }
          emit(NewsStateOnCompleted(newsList));
        } else {
          emit(const NewsStateOnFiled("Respond error"));
        }
      } on SocketException {
        emit(const NewsStateOnFiled("Socket error"));
      } catch (e) {
        emit(NewsStateOnFiled(e.toString()));
      }
    });
  }
}
