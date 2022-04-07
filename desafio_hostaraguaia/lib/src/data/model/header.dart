import 'package:desafio_hostaraguaia/src/data/model/ability_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemon_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/type_model.dart';

class Header {
  final List<AbilityModel?>? ability;
  final List<PokemonModel?>? pokemon;
  final List<TypeModel?>? type;

  Header({
    required this.ability,
    required this.pokemon,
    required this.type,
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

    return Header(
      ability: abilities,
      pokemon: pokemons,
      type: typies,
    );
  }
}
