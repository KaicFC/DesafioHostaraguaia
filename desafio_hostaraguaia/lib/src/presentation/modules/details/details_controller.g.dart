// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$pokemonDetailsModelAtom =
      Atom(name: '_DetailsControllerBase.pokemonDetailsModel');

  @override
  PokemonDetailsModel? get pokemonDetailsModel {
    _$pokemonDetailsModelAtom.reportRead();
    return super.pokemonDetailsModel;
  }

  @override
  set pokemonDetailsModel(PokemonDetailsModel? value) {
    _$pokemonDetailsModelAtom.reportWrite(value, super.pokemonDetailsModel, () {
      super.pokemonDetailsModel = value;
    });
  }

  final _$pokemonSpeciesModelAtom =
      Atom(name: '_DetailsControllerBase.pokemonSpeciesModel');

  @override
  PokemonSpeciesModel? get pokemonSpeciesModel {
    _$pokemonSpeciesModelAtom.reportRead();
    return super.pokemonSpeciesModel;
  }

  @override
  set pokemonSpeciesModel(PokemonSpeciesModel? value) {
    _$pokemonSpeciesModelAtom.reportWrite(value, super.pokemonSpeciesModel, () {
      super.pokemonSpeciesModel = value;
    });
  }

  final _$evolutionChainsModelAtom =
      Atom(name: '_DetailsControllerBase.evolutionChainsModel');

  @override
  EvolutionChainsModel? get evolutionChainsModel {
    _$evolutionChainsModelAtom.reportRead();
    return super.evolutionChainsModel;
  }

  @override
  set evolutionChainsModel(EvolutionChainsModel? value) {
    _$evolutionChainsModelAtom.reportWrite(value, super.evolutionChainsModel,
        () {
      super.evolutionChainsModel = value;
    });
  }

  final _$evolutionChainModelAtom =
      Atom(name: '_DetailsControllerBase.evolutionChainModel');

  @override
  EvolutionChainModel? get evolutionChainModel {
    _$evolutionChainModelAtom.reportRead();
    return super.evolutionChainModel;
  }

  @override
  set evolutionChainModel(EvolutionChainModel? value) {
    _$evolutionChainModelAtom.reportWrite(value, super.evolutionChainModel, () {
      super.evolutionChainModel = value;
    });
  }

  final _$listaFavoritosAtom =
      Atom(name: '_DetailsControllerBase.listaFavoritos');

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

  final _$isFavoritedAtom = Atom(name: '_DetailsControllerBase.isFavorited');

  @override
  bool get isFavorited {
    _$isFavoritedAtom.reportRead();
    return super.isFavorited;
  }

  @override
  set isFavorited(bool value) {
    _$isFavoritedAtom.reportWrite(value, super.isFavorited, () {
      super.isFavorited = value;
    });
  }

  final _$getDetailsPokemonByNameAsyncAction =
      AsyncAction('_DetailsControllerBase.getDetailsPokemonByName');

  @override
  Future getDetailsPokemonByName(String name) {
    return _$getDetailsPokemonByNameAsyncAction
        .run(() => super.getDetailsPokemonByName(name));
  }

  final _$getEvolutionsAsyncAction =
      AsyncAction('_DetailsControllerBase.getEvolutions');

  @override
  Future getEvolutions(int id) {
    return _$getEvolutionsAsyncAction.run(() => super.getEvolutions(id));
  }

  final _$addFavoriteAsyncAction =
      AsyncAction('_DetailsControllerBase.addFavorite');

  @override
  Future addFavorite(String title, int id, String image, String type) {
    return _$addFavoriteAsyncAction
        .run(() => super.addFavorite(title, id, image, type));
  }

  final _$deleteFavoriteAsyncAction =
      AsyncAction('_DetailsControllerBase.deleteFavorite');

  @override
  Future deleteFavorite(String title, int id, String image, String type) {
    return _$deleteFavoriteAsyncAction
        .run(() => super.deleteFavorite(title, id, image, type));
  }

  @override
  String toString() {
    return '''
pokemonDetailsModel: ${pokemonDetailsModel},
pokemonSpeciesModel: ${pokemonSpeciesModel},
evolutionChainsModel: ${evolutionChainsModel},
evolutionChainModel: ${evolutionChainModel},
listaFavoritos: ${listaFavoritos},
isFavorited: ${isFavorited}
    ''';
  }
}
