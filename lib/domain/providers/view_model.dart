import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/albums_model.dart';
import 'package:provide_exercise/domain/models/contacts_model.dart';
import 'package:provide_exercise/domain/models/news_detailed_model.dart';
import 'package:provide_exercise/domain/models/photos_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';
import 'package:provide_exercise/domain/repos/network_repo_impl.dart';
import 'package:provide_exercise/domain/models/news_model.dart';

enum StatusModel { isLoading, isBusy, isSuccessful, isError }

class ViewModel extends ChangeNotifier {
  ViewModel(this._networkRepoImpl);

  final NetworkRepoImpl _networkRepoImpl;

  late List<NewsModel> listNews = [];
  late List<AlbumsModel> listAlbums = [];
  late List<TodosModel> listTodos = [];
  late List<ContactsModel> listContact = [];
  late List<NewsDetailedModel> listNewsDetailed = [];
  late List<PhotosModel> listPhotos = [];

  Map<dynamic, StatusModel> state = {};

  StatusModel getStatus(String tag) {
    StatusModel model = StatusModel.isLoading;
    state.forEach((key, value) {
      if (key == tag) {
        model = value;
      } else {
        value = StatusModel.isLoading;
      }
    });
    return model;
  }

  cleanState(String tag) {
    state.forEach((key, value) {
      if (key != tag) state.update(key, (value) => StatusModel.isLoading);
    });
  }

  // Future getNews(String tag) async {
  //   try {
  //     state[tag] = StatusModel.isBusy;
  //     if (await checkInternetConnection()) {
  //       listNews.addAll(await _networkRepoImpl.getPosts());
  //       state[tag] = StatusModel.isSuccessful;
  //       Future.delayed(const Duration(seconds: 1), () => notifyListeners());
  //       cleanState(tag);
  //     }
  //   } catch (e) {
  //     state[tag] = StatusModel.isError;
  //     notifyListeners();
  //     debugPrint(e.toString());
  //   }
  // }

  Future getAlbums(String tag) async {
    try {
      state[tag] = StatusModel.isBusy;
      if (await checkInternetConnection()) {
        listAlbums.addAll(await _networkRepoImpl.getAlbums());
        state[tag] = StatusModel.isSuccessful;
        Future.delayed(const Duration(seconds: 1), () => notifyListeners());
        cleanState(tag);
      }
    } catch (_) {
      state[tag] = StatusModel.isError;
      notifyListeners();
      print(_);
    }
  }

  Future getTodos(String tag) async {
    try {
      state[tag] = StatusModel.isBusy;
      if (await checkInternetConnection()) {
        state[tag] = StatusModel.isSuccessful;
        listTodos.addAll(await _networkRepoImpl.getTodos());
        Future.delayed(const Duration(seconds: 1), () => notifyListeners());
        cleanState(tag);
      }
    } catch (_) {
      state[tag] = StatusModel.isError;
      notifyListeners();
      print(_);
    }
  }

  Future getContacts(String tag) async {
    try {
      state[tag] = StatusModel.isBusy;
      if (await checkInternetConnection()) {
        state[tag] = StatusModel.isSuccessful;
        listContact.addAll(await _networkRepoImpl.getContact());
        Future.delayed(const Duration(seconds: 1), () => notifyListeners());
        cleanState(tag);
      }
    } catch (_) {
      state[tag] = StatusModel.isError;
      notifyListeners();
      print(_);
    }
  }

  Future getNewsDetailed(int id) async {
    try {
      listNewsDetailed = [];
      if (await checkInternetConnection()) {
        var respond = await _networkRepoImpl.getNewsComments();
        for (var item in respond) {
          if (item.postId == id) {
            listNewsDetailed.add(item);
          }
        }
        Future.delayed(const Duration(seconds: 1), () => notifyListeners());
      }
    } catch (_) {
      print(_);
    }
  }

  Future getPhotos(String tag, int id) async {
    try {
      state[tag] = StatusModel.isBusy;
      listPhotos = [];
      if (await checkInternetConnection()) {
        var respond = await _networkRepoImpl.getPhotos();
        for (var item in respond) {
          if (item.albumId == id) {
            listPhotos.add(item);
          }
        }
        state[tag] = StatusModel.isSuccessful;
        Future.delayed(const Duration(seconds: 1), () => notifyListeners());
      }
    } catch (_) {
      state[tag] = StatusModel.isError;
      print(_);
    }
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      print(_.message);
      return false;
    }
  }
}
