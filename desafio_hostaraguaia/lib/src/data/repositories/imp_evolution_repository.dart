import 'package:desafio_hostaraguaia/src/data/model/evolutions/evolution_chains_model.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/evolution_repository.dart';
import 'package:desafio_hostaraguaia/src/shared/http/custom_dio.dart';
import 'package:flutter/material.dart';

class EvolutionRepository extends IEvolutionRepository {
  final CustomDio _customDio;

  EvolutionRepository(this._customDio);

  @override
  Future<EvolutionChainsModel?>? getEvolutions(String? url) async {
    try {
      var uri = Uri.parse(url!).toString();
      var response = await _customDio.instance.get(uri.toString());
      var res = await response.data;
      return EvolutionChainsModel.fromJson(res);
    } catch (err) {
      debugPrint((err as Exception).toString());
      return null;
    }
  }
}
