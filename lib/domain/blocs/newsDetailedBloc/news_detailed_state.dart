part of 'news_detailed_bloc.dart';

abstract class NewsDetailedState {
  const NewsDetailedState();
}

class NewsDetailedInitial extends NewsDetailedState {}


class NewsDetailedInitialState extends NewsDetailedState {
  @override
  List<Object> get props => [];
}

class NewsDetailedStateInProgress extends NewsDetailedState {
  const NewsDetailedStateInProgress();

  @override
  List<Object?> get props => [];
}

class NewsDetailedStateOnCompleted extends NewsDetailedState {
  const NewsDetailedStateOnCompleted(this.listNewsDetails);

  final List<NewsDetailedModel> listNewsDetails;

  @override
  List<Object?> get props => [listNewsDetails];
}

class NewsDetailedStateOnFiled extends NewsDetailedState {
  const NewsDetailedStateOnFiled(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
