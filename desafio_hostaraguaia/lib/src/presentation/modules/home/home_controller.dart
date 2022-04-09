import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IPokemonRepositories _pokemonRepositories;
  _HomeControllerBase(this._pokemonRepositories);

  @observable
  String textForm = '';
}
