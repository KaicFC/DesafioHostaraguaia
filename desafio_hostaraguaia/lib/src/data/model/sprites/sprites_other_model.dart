import 'package:desafio_hostaraguaia/src/data/model/sprites/sprites_home_model.dart';

class SpritesOtherModel {
  final SpritesHomeModel? spritesHomeModel;

  SpritesOtherModel({required this.spritesHomeModel});

  static SpritesOtherModel fromJson(Map<String, dynamic> json) {
    return SpritesOtherModel(
      spritesHomeModel: SpritesHomeModel.fromJson(json['home']),
    );
  }
}
