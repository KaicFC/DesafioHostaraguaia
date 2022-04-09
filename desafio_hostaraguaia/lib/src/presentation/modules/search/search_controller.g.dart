// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  final _$headerAtom = Atom(name: '_SearchControllerBase.header');

  @override
  Header? get header {
    _$headerAtom.reportRead();
    return super.header;
  }

  @override
  set header(Header? value) {
    _$headerAtom.reportWrite(value, super.header, () {
      super.header = value;
    });
  }

  final _$pokemonsFiltradosAtom =
      Atom(name: '_SearchControllerBase.pokemonsFiltrados');

  @override
  List<PokemonModel?> get pokemonsFiltrados {
    _$pokemonsFiltradosAtom.reportRead();
    return super.pokemonsFiltrados;
  }

  @override
  set pokemonsFiltrados(List<PokemonModel?> value) {
    _$pokemonsFiltradosAtom.reportWrite(value, super.pokemonsFiltrados, () {
      super.pokemonsFiltrados = value;
    });
  }

  final _$detailsPokemonAtom =
      Atom(name: '_SearchControllerBase.detailsPokemon');

  @override
  List<PokemonDetailsModel?> get detailsPokemon {
    _$detailsPokemonAtom.reportRead();
    return super.detailsPokemon;
  }

  @override
  set detailsPokemon(List<PokemonDetailsModel?> value) {
    _$detailsPokemonAtom.reportWrite(value, super.detailsPokemon, () {
      super.detailsPokemon = value;
    });
  }

  final _$getPokemonsByNameAsyncAction =
      AsyncAction('_SearchControllerBase.getPokemonsByName');

  @override
  Future getPokemonsByName(String query) {
    return _$getPokemonsByNameAsyncAction
        .run(() => super.getPokemonsByName(query));
  }

  @override
  String toString() {
    return '''
header: ${header},
pokemonsFiltrados: ${pokemonsFiltrados},
detailsPokemon: ${detailsPokemon}
    ''';
  }
}
