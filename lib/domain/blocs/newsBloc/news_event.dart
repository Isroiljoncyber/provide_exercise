part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class NewsEventGetPosts extends NewsEvent {
  const NewsEventGetPosts();

  @override
  List<Object?> get props => [];
}
