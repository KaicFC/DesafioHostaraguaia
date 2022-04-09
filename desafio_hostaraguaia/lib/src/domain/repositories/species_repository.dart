import 'package:desafio_hostaraguaia/src/data/model/species/species_model.dart';

abstract class ISpeciesRepository {
  Future<PokemonSpeciesModel?>? getSpecies(int id);
}
