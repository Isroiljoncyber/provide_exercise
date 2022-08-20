import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provide_exercise/domain/models/albums_model.dart';
import 'package:provide_exercise/domain/models/contacts_model.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/domain/models/photos_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';
import 'package:provide_exercise/domain/repos/network_repository.dart';
import 'package:provide_exercise/utils/constants.dart';

import '../models/news_detailed_model.dart';

class NetworkRepoImpl implements NetworkRepository {
  @override
  Future<List<NewsModel>> getPosts() async {
    try {
      List<NewsModel> newsList = [];
      var response = await get(Uri.parse("${baseUrl}posts"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = NewsModel.fromJson(item);
          newsList.add(model);
        }
      }
      return newsList;
    } on SocketException {
      print("error Socket");
    } catch (e) {
      print("error Socket");
    }
    return [];
  }

  @override
  Future<List<AlbumsModel>> getAlbums() async {
    try {
      List<AlbumsModel> albumsList = [];
      var response = await get(Uri.parse("${baseUrl}albums"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = AlbumsModel.fromJson(item);
          albumsList.add(model);
        }
      }
      return albumsList;
    } on SocketException {
      print("error Socket");
    } catch (e) {
      print("error Socket");
    }
    return [];
  }

  @override
  Future<List<TodosModel>> getTodos() async {
    try {
      List<TodosModel> todosList = [];
      var response = await get(Uri.parse("${baseUrl}todos"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = TodosModel.fromJson(item);
          todosList.add(model);
        }
      }
      return todosList;
    } on SocketException {
      print("error Socket");
    } catch (e) {
      print("error Socket");
    }
    return [];
  }

  @override
  Future<List<ContactsModel>> getContact() async {
    try {
      List<ContactsModel> contactsList = [];
      var response = await get(Uri.parse("${baseUrl}users"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = ContactsModel.fromJson(item);
          contactsList.add(model);
        }
      }
      return contactsList;
    } on SocketException {
      print("error Socket");
    } catch (e) {
      print("error Socket");
    }
    return [];
  }

  @override
  Future<List<NewsDetailedModel>> getNewsComments() async {
    try {
      List<NewsDetailedModel> commentsList = [];
      var response = await get(Uri.parse("${baseUrl}comments"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = NewsDetailedModel.fromJson(item);
          commentsList.add(model);
        }
      }
      return commentsList;
    } on SocketException {
      print("error Socket");
    } catch (e) {
      print("error Socket");
    }
    return [];
  }

  @override
  Future<List<PhotosModel>> getPhotos() async {
    try {
      List<PhotosModel> photosList = [];
      var response = await get(Uri.parse("${baseUrl}photos"));
      if (response.statusCode == 200) {
        for (var item in jsonDecode(response.body)) {
          var model = PhotosModel.fromJson(item);
          photosList.add(model);
        }
      }
      return photosList;
    } on SocketException {
      print("error Socket");
    } catch (e) {
      print("error Socket");
    }
    return [];
  }
}
