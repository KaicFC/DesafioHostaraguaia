import 'package:desafio_hostaraguaia/src/presentation/modules/details/details_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/search/search_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/app_bar.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/poke_card.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPage extends StatefulWidget {
  final String query;
  const SearchPage({Key? key, required this.query}) : super(key: key);
  static const String route = '/search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = inject.get<SearchController>();

  @override
  void initState() {
    _controller.getPokemonsByName(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _controller.header == null ||
              _controller.detailsPokemon.isEmpty == true
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBarPoke(
                      title: 'Resultado da Pesquisa',
                      query: widget.query,
                      isSearch: true,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controller.pokemonsFiltrados.length,
                        itemBuilder: (context, index) {
                          var controllerDetails =
                              _controller.detailsPokemon[index]!;
                          return PokeCard(
                            onPressed: () => NavigationHandler.push(
                              DetailsPage.route,
                              arguments: controllerDetails.id!,
                            ),
                            networkImage:
                                '${controllerDetails.spritesModel!.spritesOtherModel!.spritesHomeModel!.image}',
                            type: '${controllerDetails.types![0]!.type!.name}',
                            name: '${controllerDetails.name}',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
