part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent extends Equatable {
  const PhotosEvent();
}

class GetPhotosEvent extends PhotosEvent {
  const GetPhotosEvent(this.id);

  final int id;

  @override
  List<Object?> get props => [];
}
