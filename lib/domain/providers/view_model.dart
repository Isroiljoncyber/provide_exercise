import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provide_exercise/domain/models/albums_model.dart';
import 'package:provide_exercise/domain/models/contacts_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';
import 'package:provide_exercise/domain/repos/network_repo_impl.dart';
import 'package:provide_exercise/domain/models/news_model.dart';

class ViewModel extends ChangeNotifier {
  ViewModel(this._networkRepoImpl);

  final NetworkRepoImpl _networkRepoImpl;

  late List<NewsModel> listNews = [];
  late List<AlbumsModel> listAlbums = [];
  late List<TodosModel> listTodos = [];
  late List<ContactsModel> listContact = [];

  Future getNews() async {
    try {
      if (await checkInternetConnection()) {
        listNews.addAll(await _networkRepoImpl.getPosts());
        Future.delayed(const Duration(seconds: 2), () => notifyListeners());
      }
    } catch (_) {
      print(_);
    }
  }

  Future getAlbums() async {
    try {
      if (await checkInternetConnection()) {
        listAlbums.addAll(await _networkRepoImpl.getAlbums());
        Future.delayed(const Duration(seconds: 2), () => notifyListeners());
      }
    } catch (_) {
      print(_);
    }
  }

  Future getTodos() async {
    try {
      if (await checkInternetConnection()) {
        listTodos.addAll(await _networkRepoImpl.getTodos());
        Future.delayed(const Duration(seconds: 2), () => notifyListeners());
      }
    } catch (_) {
      print(_);
    }
  }

  Future getContacts() async {
    try {
      if (await checkInternetConnection()) {
        listContact.addAll(await _networkRepoImpl.getContact());
        Future.delayed(const Duration(seconds: 2), () => notifyListeners());
      }
    } catch (_) {
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
