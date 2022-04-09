import 'package:desafio_hostaraguaia/src/data/model/pokemons/header.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_details_model.dart';

abstract class IPokemonRepositories {
  Future<Header?>? getPokemons();
  Future<PokemonDetailsModel?>? getDetailsPokemonByName(String name);
}
