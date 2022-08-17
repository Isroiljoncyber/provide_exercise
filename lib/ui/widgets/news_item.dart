import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/utils/constants.dart';

class NewsItem extends StatelessWidget {
  const NewsItem(this._model, {Key? key}) : super(key: key);
  final NewsModel _model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: mainClr, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _model.title!,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              textAlign: TextAlign.start,
              _model.body!,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
