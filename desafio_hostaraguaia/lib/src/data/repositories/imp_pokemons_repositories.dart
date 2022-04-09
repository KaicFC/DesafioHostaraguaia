import 'package:desafio_hostaraguaia/src/data/model/pokemons/header.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/shared/http/custom_dio.dart';
import 'package:flutter/material.dart';

class PokemonsRepositories extends IPokemonRepositories {
  final CustomDio _customDio;

  PokemonsRepositories(this._customDio);

  @override
  Future<Header?>? getPokemons() async {
    try {
      var uri = Uri.parse('${_customDio.instance.options.baseUrl}pokemon/'
              '?limit=1200&offset=0')
          .toString();
      var response = await _customDio.instance.get(uri.toString());
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
      var uri = Uri.parse('${_customDio.instance.options.baseUrl}pokemon/$name')
          .toString();
      var response = await _customDio.instance.get(uri.toString());
      var res = await response.data;
      return PokemonDetailsModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }
}
