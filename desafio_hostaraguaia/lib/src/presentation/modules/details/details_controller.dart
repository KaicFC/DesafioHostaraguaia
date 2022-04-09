import 'package:desafio_hostaraguaia/src/data/model/evolutions/evolution_chains_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/species/species_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/evolution_repository.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/favorites_repository.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/species_repository.dart';
import 'package:desafio_hostaraguaia/src/shared/local/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final IPokemonRepositories _pokemonRepositories;
  final IEvolutionRepository _evolutionRepository;
  final IFavoriteRepository _favoritesRepository;
  final ISpeciesRepository _speciesRepository;

  _DetailsControllerBase(
    this._pokemonRepositories,
    this._evolutionRepository,
    this._favoritesRepository,
    this._speciesRepository,
  );

  @observable
  PokemonDetailsModel? pokemonDetailsModel;

  @observable
  PokemonSpeciesModel? pokemonSpeciesModel;

  @observable
  EvolutionChainsModel? evolutionChainsModel;

  @observable
  List listaFavoritos = [];

  @observable
  bool isFavorited = false;

  @action
  getDetailsPokemonByName(String name) async {
    try {
      pokemonDetailsModel =
          await _pokemonRepositories.getDetailsPokemonByName(name);
      List<BaseStorageData> listaController = [];
      listaController = await _favoritesRepository.getFavorites();
      for (var pokemons in listaController) {
        if (pokemons.id == pokemonDetailsModel!.id!) {
          isFavorited = true;
          break;
        }
      }
      listaFavoritos = listaController;
      return pokemonDetailsModel!;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }

  @action
  getEvolutions(int id) async {
    try {
      pokemonSpeciesModel = await _speciesRepository.getSpecies(id);

      evolutionChainsModel = await _evolutionRepository
          .getEvolutions(pokemonSpeciesModel!.evolutionChainModel!.url!);
      return evolutionChainsModel!;
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
      listaFavoritos = listaController;
      return listaFavoritos;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
