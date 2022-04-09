import 'package:desafio_hostaraguaia/src/data/model/species/species_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/species_repository.dart';
import 'package:desafio_hostaraguaia/src/shared/http/custom_dio.dart';
import 'package:flutter/material.dart';

class SpeciesRepository extends ISpeciesRepository {
  final CustomDio _customDio;

  SpeciesRepository(this._customDio);

  @override
  Future<PokemonSpeciesModel?>? getSpecies(int id) async {
    try {
      var uri = Uri.parse('${_customDio.instance.options.baseUrl}pokemon-species/$id')
          .toString();
      var response = await _customDio.instance.get(uri.toString());
      var res = await response.data;
      return PokemonSpeciesModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }
}
