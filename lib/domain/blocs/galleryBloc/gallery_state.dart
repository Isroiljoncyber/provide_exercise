part of 'gallery_bloc.dart';

@immutable
abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryStateInitial extends GalleryState {
  const GalleryStateInitial();

  @override
  List<Object?> get props => [];
}

class GalleryStateInProgress extends GalleryState {
  const GalleryStateInProgress();

  @override
  List<Object?> get props => [];
}

class GalleryStateOnCompleted extends GalleryState {
  const GalleryStateOnCompleted(this.listAlbum);

  final List<AlbumsModel> listAlbum;

  @override
  List<Object?> get props => [listAlbum];
}

class GalleryStateOnFiled extends GalleryState {
  const GalleryStateOnFiled(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
