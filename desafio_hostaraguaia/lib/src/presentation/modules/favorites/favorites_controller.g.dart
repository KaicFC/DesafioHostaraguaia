// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesControllerBase, Store {
  final _$listaFavoritosAtom =
      Atom(name: '_FavoritesControllerBase.listaFavoritos');

  @override
  List<dynamic> get listaFavoritos {
    _$listaFavoritosAtom.reportRead();
    return super.listaFavoritos;
  }

  @override
  set listaFavoritos(List<dynamic> value) {
    _$listaFavoritosAtom.reportWrite(value, super.listaFavoritos, () {
      super.listaFavoritos = value;
    });
  }

  final _$getFavoritesAsyncAction =
      AsyncAction('_FavoritesControllerBase.getFavorites');

  @override
  Future getFavorites() {
    return _$getFavoritesAsyncAction.run(() => super.getFavorites());
  }

  final _$addFavoriteAsyncAction =
      AsyncAction('_FavoritesControllerBase.addFavorite');

  @override
  Future addFavorite(String title, int id, String image, String type) {
    return _$addFavoriteAsyncAction
        .run(() => super.addFavorite(title, id, image, type));
  }

  final _$deleteFavoriteAsyncAction =
      AsyncAction('_FavoritesControllerBase.deleteFavorite');

  @override
  Future deleteFavorite(String title, int id, String image, String type) {
    return _$deleteFavoriteAsyncAction
        .run(() => super.deleteFavorite(title, id, image, type));
  }

  @override
  String toString() {
    return '''
listaFavoritos: ${listaFavoritos}
    ''';
  }
}
