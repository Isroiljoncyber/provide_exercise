import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';
import 'package:provide_exercise/utils/constants.dart';

class ContactShimmerItem extends StatelessWidget {
  const ContactShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shimmerWidget(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
          child: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width - 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
