import 'package:desafio_hostaraguaia/src/data/model/type_model.dart';

class TypesModel {
  final int? slot;
  final TypeModel? type;

  TypesModel({required this.slot, required this.type});

  static TypesModel fromJson(Map<String, dynamic> json) {
    return TypesModel(
        slot: json['slot'], type: TypeModel.fromJson(json['type']));
  }
}
