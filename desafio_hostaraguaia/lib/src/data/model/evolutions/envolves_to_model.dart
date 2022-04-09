import 'package:desafio_hostaraguaia/src/data/model/evolutions/species_model.dart';

class EnvolvesToModel {
  final SpeciesModel? speciesModel;
  final List<EnvolvesToModel?>? evolvesTo;

  EnvolvesToModel({
    required this.speciesModel,
    required this.evolvesTo,
  });

  static EnvolvesToModel fromJson(Map<String, dynamic> json) {
    List<EnvolvesToModel> evolves = [];
    if (json['evolves_to'] != null) {
      json['evolves_to'].forEach((value) {
        evolves.add(EnvolvesToModel.fromJson(value));
      });
    }
    return EnvolvesToModel(
      speciesModel: SpeciesModel.fromJson(json['species']),
      evolvesTo: evolves,
    );
  }
}
