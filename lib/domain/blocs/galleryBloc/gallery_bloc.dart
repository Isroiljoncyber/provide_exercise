import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../utils/constants.dart';
import '../../models/albums_model.dart';

part 'gallery_event.dart';

part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(const GalleryStateInitial()) {
    on<GalleryEvent>((event, emit) async {
      try {
        emit(const GalleryStateInProgress());
        List<AlbumsModel> albumsList = [];
        var response = await get(Uri.parse("${baseUrl}albums"));
        if (response.statusCode == 200) {
          for (var item in jsonDecode(response.body)) {
            var model = AlbumsModel.fromJson(item);
            albumsList.add(model);
          }
          emit(GalleryStateOnCompleted(albumsList));
        } else {
          emit(GalleryStateOnFiled(
              "Respond error: ${response.statusCode.toString()}"));
        }
      } on SocketException {
        emit(const GalleryStateOnFiled("error Socket"));
      } catch (e) {
        emit(GalleryStateOnFiled(e.toString()));
      }
    });
  }
}
