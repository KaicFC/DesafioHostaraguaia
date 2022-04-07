import 'package:desafio_hostaraguaia/src/data/model/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final IPokemonRepositories _pokemonRepositories;
  _DetailsControllerBase(this._pokemonRepositories);

  @observable
  PokemonDetailsModel? pokemonDetailsModel;

  @action
  getDetailsPokemonByName(String name) async {
    try {
      pokemonDetailsModel =
          await _pokemonRepositories.getDetailsPokemonByName(name);
      return pokemonDetailsModel!;
    } catch (err) {
      debugPrint((err as Exception).toString());
    }
  }
}
