import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/utils/constants.dart';

import '../../../domain/models/albums_model.dart';

class AlbumsShimmerItem extends StatelessWidget {
  const AlbumsShimmerItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: shimmerWidget(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            height: 15,
            width: double.maxFinite,
          ),
        ),
      ),
    );
  }
}
