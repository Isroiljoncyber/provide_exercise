import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:provide_exercise/domain/models/photos_model.dart';

import '../../../utils/constants.dart';

part 'photos_event.dart';

part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosStateInitial()) {
    on<GetPhotosEvent>((event, emit) async {
      try {
        List<PhotosModel> photosList = [];
        var response = await get(Uri.parse("${baseUrl}photos"));
        if (response.statusCode == 200) {
          for (var item in jsonDecode(response.body)) {
            var model = PhotosModel.fromJson(item);
            if (event.id == model.albumId) {
              photosList.add(model);
            }
          }
          emit(PhotoStateOnCompleted(photosList));
        } else {
          emit(PhotoStateOnFiled(
              "Respond error: ${response.statusCode.toString()}"));
        }
      } on SocketException {
        emit(const PhotoStateOnFiled("Socket error"));
      } catch (e) {
        emit(PhotoStateOnFiled(e.toString()));
      }
    });
  }
}
