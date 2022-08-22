part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsStateInProgress extends NewsState {
  const NewsStateInProgress();

  @override
  List<Object?> get props => [];
}

class NewsStateOnCompleted extends NewsState {
  const NewsStateOnCompleted(this.listNews);

  final List<NewsModel> listNews;

  @override
  List<Object?> get props => [listNews];
}

class NewsStateOnFiled extends NewsState {
  const NewsStateOnFiled(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}