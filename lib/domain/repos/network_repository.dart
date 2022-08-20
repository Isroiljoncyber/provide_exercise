import 'package:provide_exercise/domain/models/albums_model.dart';
import 'package:provide_exercise/domain/models/news_detailed_model.dart';
import 'package:provide_exercise/domain/models/news_model.dart';
import 'package:provide_exercise/domain/models/todos_model.dart';

import '../models/contacts_model.dart';
import '../models/photos_model.dart';

abstract class NetworkRepository {
  Future<List<NewsModel>> getPosts();

  Future<List<AlbumsModel>> getAlbums();

  Future<List<TodosModel>> getTodos();

  Future<List<ContactsModel>> getContact();

  Future<List<NewsDetailedModel>> getNewsComments();

  Future<List<PhotosModel>> getPhotos();
}
