import 'package:desafio_hostaraguaia/src/data/repositories/imp_pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/http/custom_dio.dart';

Future<void> domainInjection() async {
  
  inject.registerFactory<CustomDio>(() => CustomDio.getInstance());

  inject.registerLazySingleton<IPokemonRepositories>(
      () => PokemonsRepositories(inject.get()));
}
