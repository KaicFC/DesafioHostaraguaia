class PokemonSpeciesModel {
  final String? evolutionChainModel;

  PokemonSpeciesModel({
    required this.evolutionChainModel,
  });

  static PokemonSpeciesModel fromJson(Map<String, dynamic> json) {
    return PokemonSpeciesModel(evolutionChainModel: json['evolution_chain']['url']);
  }
}
