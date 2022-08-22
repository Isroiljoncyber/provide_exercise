import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/galleryBloc/gallery_bloc.dart';
import 'package:provide_exercise/ui/widgets/alboms_item.dart';
import 'package:provide_exercise/ui/widgets/shimmerItems/alboms_shimmer_item.dart';
import 'package:provide_exercise/utils/constants.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GalleryBloc>().add(const GetGalleryEvent());
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
      body: BlocBuilder<GalleryBloc, GalleryState>(builder: (context, state) {
        if (state is GalleryStateOnCompleted) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.listAlbum.length,
            itemBuilder: (context, index) {
              return AlbumsItem(state.listAlbum[index]);
            },
          );
        } else if (state is GalleryStateOnFiled) {
          return Center(
            child: Text("Error: ${state.message}"),
          );
        } else if (state is GalleryStateInProgress) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const AlbumsShimmerItem();
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
