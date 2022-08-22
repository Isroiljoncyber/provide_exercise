part of 'gallery_bloc.dart';

@immutable
abstract class GalleryEvent extends Equatable{
  const GalleryEvent();
}

class GetGalleryEvent extends GalleryEvent {
  const GetGalleryEvent();

  @override
  List<Object?> get props => [];

}
