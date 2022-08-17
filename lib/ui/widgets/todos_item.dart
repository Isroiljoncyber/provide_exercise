import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';
import 'package:provide_exercise/utils/constants.dart';

class TodosItem extends StatelessWidget {
  const TodosItem(this._model, {Key? key}) : super(key: key);
  final TodosModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10),
      child: Container(
        color: _model.completed! ? itemClr : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: _model.completed,
              onChanged: (bool? value) {},
              autofocus: false,
              activeColor: checkBoxClr,
              focusColor: checkBoxClr,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Text(
                _model.title!,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
