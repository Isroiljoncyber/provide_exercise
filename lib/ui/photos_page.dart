import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provide_exercise/domain/blocs/photosBloc/photos_bloc.dart';
import 'package:provide_exercise/domain/providers/view_model.dart';
import 'package:provide_exercise/ui/widgets/photos_item.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provider/provider.dart';

import '../domain/models/albums_model.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage(this._model, {Key? key}) : super(key: key);

  final AlbumsModel _model;

  @override
  Widget build(BuildContext context) {
    context.read<PhotosBloc>().add(GetPhotosEvent(_model.userId!));
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
      body: BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
        if (state is PhotoStateOnCompleted) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.listPhoto.length,
            itemBuilder: (context, index) {
              return PhotosItem(state.listPhoto[index]);
            },
          );
        } else if (state is PhotoStateInProgress) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (state is PhotoStateOnFiled) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
