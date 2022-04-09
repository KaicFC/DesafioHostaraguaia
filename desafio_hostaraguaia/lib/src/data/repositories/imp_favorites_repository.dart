import 'package:desafio_hostaraguaia/src/domain/repositories/favorites_repository.dart';
import 'package:desafio_hostaraguaia/src/shared/local/local_storage.dart';
import 'package:flutter/material.dart';

class FavoritesRepository extends IFavoriteRepository {
  final BaseStorageDatabase _db;
  FavoritesRepository(this._db);

  @override
  Future getFavorites() async {
    try {
      var favorites = await BaseStorageDao(_db).getAll();
      return favorites;
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }

  @override
  Future addFavorite(int id, String title, String image, String type) async {
    try {
      var favorites = await BaseStorageDao(_db).insert(BaseStorageData(
        title: title,
        id: id,
        image: image,
        type: type,
      ));
      favorites = await BaseStorageDao(_db).getAll();
      return favorites;
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }

  @override
  Future deleteFavorite(int id, String title, String image, String type) async {
    try {
      var favorites = await BaseStorageDao(_db).deleteById(BaseStorageData(
        title: title,
        id: id,
        image: image,
        type: type,
      ));
      favorites = await BaseStorageDao(_db).getAll();
      return favorites;
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }
}
