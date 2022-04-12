import 'package:desafio_hostaraguaia/src/data/model/abilities/ability_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/species/evolution_chain_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/types/type_model.dart';

class Header {
  final List<AbilityModel?>? ability;
  final List<PokemonModel?>? pokemon;
  final List<TypeModel?>? type;
  final List<EvolutionChainModel?>? pokemonSpecies;

  Header({
    required this.ability,
    required this.pokemon,
    required this.type,
    required this.pokemonSpecies,
  });

  static Header fromJson(Map<String, dynamic> json) {
    List<AbilityModel> abilities = [];

    if (json['results'] != null) {
      json['results'].forEach((value) {
        abilities.add(AbilityModel.fromJson(value));
      });
    }

    List<PokemonModel> pokemons = [];
    if (json['results'] != null) {
      json['results'].forEach((value) {
        pokemons.add(PokemonModel.fromJson(value));
      });
    }

    List<TypeModel> typies = [];
    if (json['results'] != null) {
      json['results'].forEach((value) {
        typies.add(TypeModel.fromJson(value));
      });
    }

    List<EvolutionChainModel> pokeSpecies = [];
    if (json['results'] != null) {
      json['results'].forEach((value) {
        pokeSpecies.add(EvolutionChainModel.fromJson(value));
      });
    }

    return Header(
      ability: abilities,
      pokemon: pokemons,
      type: typies,
      pokemonSpecies: pokeSpecies,
    );
  }
}
