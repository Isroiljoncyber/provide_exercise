import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_detailed_model.dart';
import 'package:provide_exercise/utils/constants.dart';

class NewsDetailedItem extends StatelessWidget {
  const NewsDetailedItem(this._detailedModel, {Key? key}) : super(key: key);
  final NewsDetailedModel _detailedModel;

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
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: iconBgClr,
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: Colors.grey,
                ),
              ),
              Flexible(
                child: Text(
                  overflow: TextOverflow.clip,
                  _detailedModel.name!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              _detailedModel.body!,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
