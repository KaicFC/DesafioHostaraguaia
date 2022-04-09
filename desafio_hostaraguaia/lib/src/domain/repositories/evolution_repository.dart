import 'package:desafio_hostaraguaia/src/data/model/evolutions/evolution_chains_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/species/evolution_chain_model.dart';

abstract class IEvolutionRepository {
  Future<EvolutionChainsModel?>? getEvolutions(String url);
}
