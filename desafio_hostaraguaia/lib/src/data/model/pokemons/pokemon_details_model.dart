import 'package:desafio_hostaraguaia/src/data/model/abilities/abilities_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/sprites/sprites_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/stats/stats_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/types/types_model.dart';

class PokemonDetailsModel {
  final List<AbilitiesModel?>? abilities;
  final List<StatsModel?>? stats;
  final int? baseExperience;
  final int? height;
  final int? weight;
  final int? id;
  final String? name;
  final List<TypesModel?>? types;
  final SpritesModel? spritesModel;

  PokemonDetailsModel({
    required this.stats,
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.id,
    required this.name,
    required this.types,
    required this.spritesModel,
  });

  static PokemonDetailsModel fromJson(Map<String, dynamic> json) {
    List<AbilitiesModel> abilitiess = [];
    if (json['abilities'] != null) {
      json['abilities'].forEach((value) {
        abilitiess.add(AbilitiesModel.fromJson(value));
      });
    }

    List<StatsModel> statss = [];
    if (json['stats'] != null) {
      json['stats'].forEach((value) {
        statss.add(StatsModel.fromJson(value));
      });
    }

    List<TypesModel> typies = [];
    if (json['types'] != null) {
      json['types'].forEach((value) {
        typies.add(TypesModel.fromJson(value));
      });
    }

    return PokemonDetailsModel(
      abilities: abilitiess,
      stats: statss,
      baseExperience: json['baseExperience'],
      height: json['height'],
      weight: json['weight'],
      id: json['id'],
      name: json['name'],
      types: typies,
      spritesModel: SpritesModel.fromJson(json['sprites']),
    );
  }
}
