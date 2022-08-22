part of 'news_detailed_bloc.dart';

@immutable
abstract class NewsDetailedEvent {
  const NewsDetailedEvent();
}

// Comments or news detail information
class NewsEventGetMoreDetail extends NewsDetailedEvent {
  const NewsEventGetMoreDetail(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}
