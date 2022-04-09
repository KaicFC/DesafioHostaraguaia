import 'package:desafio_hostaraguaia/src/presentation/modules/details/details_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/favorites/favorites_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/app_bar.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/poke_card.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);
  static const String route = '/favorites_page';

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final _controller = inject.get<FavoritesController>();

  @override
  void initState() {
    _controller.getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const AppBarPoke(
                title: 'Favoritos',
                query: 'query',
                isSearch: false,
              ),
              _controller.listaFavoritos.isEmpty == true
                  ? const Center(child: Text('Sem favoritos'))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _controller.listaFavoritos.length,
                        itemBuilder: (context, index) {
                          return PokeCard(
                            onPressed: () => NavigationHandler.push(
                              DetailsPage.route,
                              arguments: _controller.listaFavoritos[index].id!,
                            ),
                            networkImage:
                                '${_controller.listaFavoritos[index].image}',
                            type: '${_controller.listaFavoritos[index].type}',
                            name: '${_controller.listaFavoritos[index].title}',
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
