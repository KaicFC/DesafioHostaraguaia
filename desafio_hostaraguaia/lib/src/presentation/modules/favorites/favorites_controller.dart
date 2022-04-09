import 'package:desafio_hostaraguaia/src/domain/repositories/favorites_repository.dart';
import 'package:desafio_hostaraguaia/src/shared/local/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  final IFavoriteRepository _favoritesRepository;
  _FavoritesControllerBase(this._favoritesRepository);

  @observable
  List listaFavoritos = [];

  @action
  getFavorites() async {
    try {
      List<BaseStorageData> listaController = [];

      listaController = await _favoritesRepository.getFavorites();
      listaFavoritos = listaController;

      print(listaFavoritos);

      return listaFavoritos;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }

  @action
  addFavorite(String title, int id, String image, String type) async {
    try {
      List<BaseStorageData> listaController = [];

      listaController =
          await _favoritesRepository.addFavorite(id, title, image, type);

      listaFavoritos = listaController;

      listaController = await _favoritesRepository.getFavorites();

      print(listaFavoritos);

      return listaFavoritos;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }

  @action
  deleteFavorite(String title, int id, String image, String type) async {
    try {
      List<BaseStorageData> listaController = [];
      listaController =
          await _favoritesRepository.deleteFavorite(id, title, image, type);

      listaController = await _favoritesRepository.getFavorites();

      listaFavoritos = listaController;

      return listaFavoritos;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
