import 'package:desafio_hostaraguaia/src/data/model/species/evolution_chain_model.dart';

class PokemonSpeciesModel {
  final EvolutionChainModel? evolutionChainModel;

  PokemonSpeciesModel({
    required this.evolutionChainModel,
  });

  static PokemonSpeciesModel fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesModel(evolutionChainModel: json['evolution_chain']);
  }
}
