import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/contacts_model.dart';
import 'package:provide_exercise/utils/constants.dart';
import 'package:provide_exercise/utils/routes.dart';


class PersonalPage extends StatelessWidget {
  const PersonalPage(this._model, {Key? key}) : super(key: key);
  final ContactsModel _model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgClr2,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: appbarClr,
        centerTitle: true,
        title: Text(
          _model.name!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: iconBgClr,
              ),
              child: const Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: _model.name!,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    children: [
                      TextSpan(
                          text: "\n${_model.email!}",
                          style: TextStyle(color: checkBoxClr))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text("E-mail"),
                  labelStyle: TextStyle(
                      color: checkBoxClr,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: checkBoxClr, width: 2),
                  ),
                  enabled: false,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: TextEditingController()..text = _model.email!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text("Phone number"),
                  labelStyle: TextStyle(
                      color: checkBoxClr,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: checkBoxClr, width: 2),
                  ),
                  enabled: false,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: TextEditingController()..text = _model.phone!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text("Website"),
                  labelStyle: TextStyle(
                      color: checkBoxClr,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: checkBoxClr, width: 2),
                  ),
                  enabled: false,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: TextEditingController()..text = _model.website!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text("Company"),
                  labelStyle: TextStyle(
                      color: checkBoxClr,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: checkBoxClr, width: 2),
                  ),
                  enabled: false,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: TextEditingController()
                  ..text = _model.company!.name!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text("Address"),
                  labelStyle: TextStyle(
                      color: checkBoxClr,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: checkBoxClr, width: 2),
                  ),
                  enabled: false,
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                controller: TextEditingController()
                  ..text = _model.address!.street!,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.googleMapPage);
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    child: const Center(
                      child: Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
