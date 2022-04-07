import 'package:desafio_hostaraguaia/src/data/model/sprites_other_model.dart';

class SpritesModel {
  final SpritesOtherModel? spritesOtherModel;

  SpritesModel({required this.spritesOtherModel});

  static SpritesModel fromJson(Map<String, dynamic> json) {
    return SpritesModel(spritesOtherModel: SpritesOtherModel.fromJson(json['other']));
  }
}
