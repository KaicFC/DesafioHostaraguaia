import 'package:desafio_hostaraguaia/src/data/model/header.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemon_details_model.dart';

abstract class IPokemonRepositories {
  Future<Header?>? getPokemons();
  Future<PokemonDetailsModel?>? getDetailsPokemonByName(String name);
}
