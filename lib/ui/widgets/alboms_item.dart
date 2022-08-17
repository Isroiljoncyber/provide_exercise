import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/utils/constants.dart';

import '../../domain/models/albums_model.dart';

class AlbumsItem extends StatelessWidget {
  const AlbumsItem(this._model, {Key? key}) : super(key: key);
  final AlbumsModel _model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          _model.title!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
