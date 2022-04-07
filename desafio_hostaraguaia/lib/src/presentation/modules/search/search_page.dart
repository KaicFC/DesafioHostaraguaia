import 'package:desafio_hostaraguaia/src/data/model/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/data/model/pokemon_model.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/details/details_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/search/search_controller.dart';
import 'package:desafio_hostaraguaia/src/shared/constants/constants.dart';
import 'package:desafio_hostaraguaia/src/shared/constants/strings.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  children: [
                    AppBar(widget: widget),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controller.pokemonsFiltrados.length,
                        itemBuilder: (context, index) {
                          var controllerFiltrado =
                              _controller.pokemonsFiltrados[index]!;
                          var controllerDetails =
                              _controller.detailsPokemon[index]!;
                          return PokeCard(
                            controller: controllerFiltrado,
                            controllerDetails: controllerDetails,
                            onPressed: () => NavigationHandler.push(
                              DetailsPage.route,
                              arguments: controllerFiltrado.name!,
                            ),
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

class PokeCard extends StatelessWidget {
  final Function()? onPressed;

  const PokeCard({
    Key? key,
    required this.controller,
    required this.controllerDetails,
    required this.onPressed,
  }) : super(key: key);

  final PokemonModel controller;
  final PokemonDetailsModel controllerDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Container(
        color: Colors.white,
        height: 85,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Constants.colorRed1,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            '${controllerDetails.spritesModel!.spritesOtherModel!.spritesHomeModel!.image}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toTitleText(controller.name!),
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Constants.colorRed1,
                          ),
                        ),
                        Text(
                          toTitleText(
                              'Tipo: ${controllerDetails.types![0]!.type!.name}'),
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constants.colorGrey2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Constants.colorRed1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SearchPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () => NavigationHandler.pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Constants.primaryColor,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Resultado da pesquisa',
                  style: GoogleFonts.openSans(
                    color: Constants.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () => NavigationHandler.pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.transparent,
                    size: 25,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  toCapitalize(widget.query),
                  style: GoogleFonts.openSans(
                    color: Constants.colorGrey3,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
