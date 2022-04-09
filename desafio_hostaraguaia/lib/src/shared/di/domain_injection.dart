import 'package:desafio_hostaraguaia/src/data/repositories/imp_evolution_repository.dart';
import 'package:desafio_hostaraguaia/src/data/repositories/imp_favorites_repository.dart';
import 'package:desafio_hostaraguaia/src/data/repositories/imp_pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/data/repositories/imp_species_repository.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/evolution_repository.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/favorites_repository.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/pokemons_repositories.dart';
import 'package:desafio_hostaraguaia/src/domain/repositories/species_repository.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/http/custom_dio.dart';
import 'package:desafio_hostaraguaia/src/shared/local/local_storage.dart';

Future<void> domainInjection() async {
  inject.registerFactory<CustomDio>(() => CustomDio.getInstance());
  inject.registerFactory<BaseStorageDatabase>(() => BaseStorageDatabase());

  inject.registerLazySingleton<IPokemonRepositories>(
      () => PokemonsRepositories(inject.get()));
  inject.registerLazySingleton<IEvolutionRepository>(
      () => EvolutionRepository(inject.get()));
  inject.registerLazySingleton<IFavoriteRepository>(
      () => FavoritesRepository(inject.get()));
  inject.registerLazySingleton<ISpeciesRepository>(
      () => SpeciesRepository(inject.get()));
}
