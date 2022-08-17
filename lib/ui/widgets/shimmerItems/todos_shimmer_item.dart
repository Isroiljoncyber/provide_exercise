import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';
import 'package:provide_exercise/utils/constants.dart';

class TodosShimmerItem extends StatelessWidget {
  const TodosShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shimmerWidget(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 25,
              width: 25,
              color: Colors.white,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(left: 16),
              height: 12,
              width: MediaQuery.of(context).size.width - 100,
            ),
          ],
        ),
      ),
    );
  }
}
