import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/alboms_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/alboms_shimmer_item.dart';
import 'package:provide_exercise/ui/widgets/news_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/news_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);
  final String tag = "gallery";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr,
      appBar: AppBar(
        backgroundColor: appbarClr,
        centerTitle: true,
        title: const Text(
          "Gallery",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.getStatus(tag) != StatusModel.isSuccessful) {
            viewModel.getAlbums(tag);
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount:
                viewModel.listAlbums.isEmpty ? 10 : viewModel.listAlbums.length,
            itemBuilder: (context, index) {
              if (viewModel.getStatus(tag) == StatusModel.isSuccessful) {
                return AlbumsItem(viewModel.listAlbums[index]);
              } else {
                return const AlbumsShimmerItem();
              }
            },
          );
        },
      ),
    );
  }
}
