import 'package:desafio_hostaraguaia/src/data/model/pokemons/header.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final IPokemonRepositories _pokemonRepositories;
  _SearchControllerBase(this._pokemonRepositories);

  @observable
  Header? header;

  @observable
  List<PokemonModel?> pokemonsFiltrados = [];

  @observable
  List<PokemonDetailsModel?> detailsPokemon = [];

  @action
  getPokemonsByName(String query) async {
    try {
      header = await _pokemonRepositories.getPokemons();
      pokemonsFiltrados.clear();
      detailsPokemon.clear();

      var listaController = header!.pokemon!
          .where((element) =>
              element!.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();

      pokemonsFiltrados = listaController;

      List<PokemonDetailsModel?> listaTypes = [];

      for (var pokemon in pokemonsFiltrados) {
        var pokeType =
            await _pokemonRepositories.getDetailsPokemonByName(pokemon!.name!);
        listaTypes.add(pokeType);
      }

      detailsPokemon = listaTypes;
      return pokemonsFiltrados;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
