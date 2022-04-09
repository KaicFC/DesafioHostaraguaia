import 'package:desafio_hostaraguaia/src/data/model/evolutions/chain_model.dart';

class EvolutionChainsModel {
  final ChainModel? chainModel;
  EvolutionChainsModel({required this.chainModel});

  static EvolutionChainsModel fromJson(Map<String, dynamic> json) {
    return EvolutionChainsModel(chainModel: ChainModel.fromJson(json['chain']));
  }
}
