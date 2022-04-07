// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$pokemonDetailsModelAtom =
      Atom(name: '_DetailsControllerBase.pokemonDetailsModel');

  @override
  PokemonDetailsModel? get pokemonDetailsModel {
    _$pokemonDetailsModelAtom.reportRead();
    return super.pokemonDetailsModel;
  }

  @override
  set pokemonDetailsModel(PokemonDetailsModel? value) {
    _$pokemonDetailsModelAtom.reportWrite(value, super.pokemonDetailsModel, () {
      super.pokemonDetailsModel = value;
    });
  }

  final _$getDetailsPokemonByNameAsyncAction =
      AsyncAction('_DetailsControllerBase.getDetailsPokemonByName');

  @override
  Future getDetailsPokemonByName(String name) {
    return _$getDetailsPokemonByNameAsyncAction
        .run(() => super.getDetailsPokemonByName(name));
  }

  @override
  String toString() {
    return '''
pokemonDetailsModel: ${pokemonDetailsModel}
    ''';
  }
}
