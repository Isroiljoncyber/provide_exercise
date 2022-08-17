import 'package:flutter/material.dart';
import 'package:provide_exercise/utils/constants.dart';
import '../../domain/models/contacts_model.dart';

class ContactItem extends StatelessWidget {
  const ContactItem(this._model, {Key? key}) : super(key: key);
  final ContactsModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
          child: Row(
            children: [
              const Icon(
                Icons.person_rounded,
                size: 30,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  textAlign: TextAlign.start,
                  _model.name!,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
