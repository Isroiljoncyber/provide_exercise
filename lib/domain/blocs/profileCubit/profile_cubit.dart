import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:provide_exercise/domain/models/contacts_model.dart';

import '../../../utils/constants.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileStateInitial());

  Future getContactsCubit() async {
    try {
      List<ContactsModel> contactsList = [];
      emit(const ProfileStateInProgress());
      var response = await get(Uri.parse("${baseUrl}users"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = ContactsModel.fromJson(item);
          contactsList.add(model);
        }
        Future.delayed(const Duration(seconds: 1), () {
          emit(ProfileStateOnCompleted(contactsList));
        });
      } else {
        emit(ProfileStateOnFiled(
            "Respond error: ${response.statusCode.toString()}"));
      }
    } on SocketException {
      emit(const ProfileStateOnFiled("Socket error"));
    } catch (e) {
      emit(ProfileStateOnFiled(e.toString()));
    }
  }
}
