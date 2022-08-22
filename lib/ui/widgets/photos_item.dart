import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provide_exercise/domain/models/photos_model.dart';

class PhotosItem extends StatelessWidget {
  PhotosItem(this._model, {Key? key}) : super(key: key);
  final PhotosModel _model;

  final customManager = CacheManager(
    Config(
      "customKey",
      stalePeriod: const Duration(hours: 1),
      maxNrOfCacheObjects: 100,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Image(image: CachedNetworkImageProvider(_model.url!));
    // const CircularProgressIndicator();
  }
}
