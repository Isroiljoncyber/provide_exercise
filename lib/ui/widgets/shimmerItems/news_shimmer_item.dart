import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmerItem extends StatelessWidget {
  const NewsShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: itemClr,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shimmerWidget(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: shimmerWidget(
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: Colors.white,
                  ),
                  width: double.infinity,
                  height: 10,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
