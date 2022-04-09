import 'package:desafio_hostaraguaia/src/data/model/abilities/ability_model.dart';

class AbilitiesModel {
  final AbilityModel? ability;
  final bool? isHidden;
  final int? slot;

  AbilitiesModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  static AbilitiesModel fromJson(Map<String, dynamic> json) {
    return AbilitiesModel(
        ability: AbilityModel.fromJson(json['ability']),
        isHidden: json['is_hidden'],
        slot: json['slot']);
  }
}
