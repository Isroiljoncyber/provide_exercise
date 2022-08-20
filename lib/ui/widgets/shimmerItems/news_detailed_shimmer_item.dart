import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_detailed_model.dart';
import 'package:provide_exercise/utils/constants.dart';

class NewsDetailedShimmerItem extends StatelessWidget {
  const NewsDetailedShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: itemClr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              shimmerWidget(
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: iconBgClr,
                  ),
                ),
              ),
              Flexible(
                child: shimmerWidget(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey,
                    ),
                    height: 12,
                    width: double.maxFinite,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Flexible(
              child: shimmerWidget(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                      height: 12,
                      width: double.maxFinite,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                      height: 12,
                      width: double.maxFinite,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                      height: 12,
                      width: double.maxFinite,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 12,
                      width: double.maxFinite,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
