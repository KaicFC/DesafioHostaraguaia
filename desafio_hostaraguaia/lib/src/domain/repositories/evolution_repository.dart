import 'package:desafio_hostaraguaia/src/data/model/evolutions/evolution_chains_model.dart';

abstract class IEvolutionRepository {
  Future<EvolutionChainsModel?>? getEvolutions(String? url);
}
