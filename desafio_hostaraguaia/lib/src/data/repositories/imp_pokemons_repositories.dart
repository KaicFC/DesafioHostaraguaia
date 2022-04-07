import 'package:desafio_hostaraguaia/src/data/model/header.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/shared/http/custom_dio.dart';
import 'package:flutter/material.dart';

class PokemonsRepositories extends IPokemonRepositories {
  final CustomDio _customDio;

  PokemonsRepositories(this._customDio);

  @override
  Future<Header?>? getPokemons() async {
    try {
      var response = await _customDio.instance
          .get('${_customDio.getPokemons()}?limit=1200&offset=0'.toString());
      var res = await response.data;
      return Header.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }

  @override
  Future<PokemonDetailsModel?>? getDetailsPokemonByName(String name) async {
    try {
      var response = await _customDio.instance
          .get(_customDio.getDetailsPokemonByName(name).toString());
      var res = await response.data;
      return PokemonDetailsModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }
}
