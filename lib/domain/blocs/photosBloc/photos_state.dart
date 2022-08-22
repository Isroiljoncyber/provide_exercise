part of 'photos_bloc.dart';

@immutable
abstract class PhotosState extends Equatable {
  const PhotosState();
}

class PhotosStateInitial extends PhotosState {
  @override
  List<Object?> get props => [];
}

class PhotoStateInProgress extends PhotosState {
  const PhotoStateInProgress();

  @override
  List<Object?> get props => [];
}

class PhotoStateOnCompleted extends PhotosState {
  const PhotoStateOnCompleted(this.listPhoto);

  final List<PhotosModel> listPhoto;

  @override
  List<Object?> get props => [listPhoto];
}

class PhotoStateOnFiled extends PhotosState {
  const PhotoStateOnFiled(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
