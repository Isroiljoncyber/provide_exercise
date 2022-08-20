import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/alboms_item.dart';
import 'package:provide_exercise/ui/widgets/photos_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/alboms_shimmer_item.dart';
import 'package:provide_exercise/ui/widgets/news_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../domain/models/albums_model.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage(this._model, {Key? key}) : super(key: key);
  final String tag = "photos";

  final AlbumsModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: appbarClr,
        centerTitle: true,
        title: Text(
          _model.title!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.getStatus(tag) != StatusModel.isSuccessful) {
            viewModel.getPhotos(tag, _model.userId!);
            return const Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: viewModel.listPhotos.isEmpty
                  ? 20
                  : viewModel.listPhotos.length,
              itemBuilder: (context, index) {
                return PhotosItem(viewModel.listPhotos[index]);
              },
            );
          }
        },
      ),
    );
  }
}
