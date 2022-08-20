import 'package:flutter/material.dart';

import '../../domain/models/news_model.dart';
import '../../utils/routes.dart';

class BottomNav extends StatelessWidget {
  const BottomNav(this._newsModel, {Key? key}) : super(key: key);
  final NewsModel _newsModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.newsDetailedResultPage,
              arguments: {'newsModel': _newsModel});
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 70,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.blueAccent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Show me 5 results",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.visibility_rounded,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
