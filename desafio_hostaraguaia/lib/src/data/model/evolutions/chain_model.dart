import 'package:desafio_hostaraguaia/src/data/model/evolutions/envolves_to_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/evolutions/species_model.dart';

class ChainModel {
  final SpeciesModel? species;
  final List<EnvolvesToModel?>? evolvesTo;

  ChainModel({
    required this.species,
    required this.evolvesTo,
  });

  static ChainModel fromJson(Map<String, dynamic> json) {
      List<EnvolvesToModel> evolves = [];
    if (json['evolves_to'] != null) {
      json['evolves_to'].forEach((value) {
        evolves.add(EnvolvesToModel.fromJson(value));
      });
    }

    return ChainModel(
      species: SpeciesModel.fromJson(json['species']),
      evolvesTo: evolves,
    );
  }
}
