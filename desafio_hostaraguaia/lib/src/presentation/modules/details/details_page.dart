import 'package:desafio_hostaraguaia/src/data/model/pokemons/pokemon_details_model.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/details/details_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/home/home_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/text_principal.dart';
import 'package:desafio_hostaraguaia/src/shared/constants/constants.dart';
import 'package:desafio_hostaraguaia/src/shared/constants/strings.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  static const String route = '/details_page';

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final _controller = inject.get<DetailsController>();

  @override
  void initState() {
    _controller.getDetailsPokemonByName(widget.id.toString());
    //_controller.getEvolutions(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return _controller.pokemonDetailsModel == null 
      //||  _controller.evolutionChainsModel == null
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appbar(
                      controller: _controller,
                      isFavorited: _controller.isFavorited,
                      onPressed: () {
                        var controller = _controller.pokemonDetailsModel!;
                        changeFavorite(controller);
                      },
                    ),
                    Caracteristicas(controller: _controller),
                  ],
                ),
              ),
            );
    });
  }

  void changeFavorite(PokemonDetailsModel controller) {
    if (_controller.isFavorited) {
      _controller.deleteFavorite(
        controller.name!,
        controller.id!,
        controller.spritesModel!.spritesOtherModel!.spritesHomeModel!.image!,
        controller.types![0]!.type!.name!,
      );
      Fluttertoast.showToast(
        msg: "Removido dos Favoritos",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Constants.colorGrey2,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      _controller.addFavorite(
        controller.name!,
        controller.id!,
        controller.spritesModel!.spritesOtherModel!.spritesHomeModel!.image!,
        controller.types![0]!.type!.name!,
      );
      Fluttertoast.showToast(
        msg: "Pokemon Favoritado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Constants.colorGrey2,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    _controller.isFavorited = !_controller.isFavorited;
  }
}

class Caracteristicas extends StatelessWidget {
  const Caracteristicas({
    Key? key,
    required DetailsController controller,
  })  : _controller = controller,
        super(key: key);

  final DetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              'Características',
              style: Constants.fontOpenSans(
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ),
          const Subtitle(title: 'Peso', padding: 14),
          Text(
            '${_controller.pokemonDetailsModel!.weight} kg',
            style: Constants.fontOpenSans(
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Constants.colorRed1,
              ),
            ),
          ),
          const Subtitle(title: 'Evoluções', padding: 34),
          // Evolutions(controller: _controller),
          const Subtitle(title: 'Status Base', padding: 34),
          StatusBase(controller: _controller),
          const Subtitle(title: 'Habilidades', padding: 34),
          Habilidades(controller: _controller)
        ],
      ),
    );
  }
}

class Evolutions extends StatelessWidget {
  const Evolutions({
    Key? key,
    required DetailsController controller,
  })  : _controller = controller,
        super(key: key);

  final DetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          TextPrincipal(
              text:
                  '${_controller.evolutionChainsModel!.chainModel!.species!.name}'),
          TextPrincipal(
              text:
                  '${_controller.evolutionChainsModel!.chainModel!.evolvesTo![0]!.speciesModel!.name}'),
          TextPrincipal(
              text:
                  '${_controller.evolutionChainsModel!.chainModel!.evolvesTo![0]!.evolvesTo![0]!.speciesModel!.name}'),
        ],
      ),
    );
  }
}

class Habilidades extends StatelessWidget {
  const Habilidades({
    Key? key,
    required DetailsController controller,
  })  : _controller = controller,
        super(key: key);

  final DetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _controller.pokemonDetailsModel!.abilities!.length,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Constants.colorRed1,
                    size: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Text(
                      toTitleText(
                        '${_controller.pokemonDetailsModel!.abilities![index]!.ability!.name}',
                      ),
                      style: Constants.fontOpenSans(
                        TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Constants.colorRed1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class StatusBase extends StatelessWidget {
  const StatusBase({
    Key? key,
    required DetailsController controller,
  })  : _controller = controller,
        super(key: key);

  final DetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _controller.pokemonDetailsModel!.stats!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_controller.pokemonDetailsModel!.stats![index]!.baseStat}',
                        style: Constants.fontOpenSans(
                          TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Constants.colorRed1,
                          ),
                        ),
                      ),
                      Text(
                        '${_controller.pokemonDetailsModel!.stats![index]!.stat!.name}'
                            .toUpperCase(),
                        style: Constants.fontOpenSans(
                          TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constants.colorRed1,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String title;
  final double padding;
  const Subtitle({Key? key, required this.title, required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: Text(
        title,
        style: Constants.fontOpenSans(
          TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Constants.primaryColor,
          ),
        ),
      ),
    );
  }
}

class Appbar extends StatelessWidget {
  final DetailsController _controller;
  final Function()? onPressed;
  final bool isFavorited;

  const Appbar({
    Key? key,
    required DetailsController controller,
    required this.onPressed,
    required this.isFavorited,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Constants.colorRed1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    alignment: AlignmentDirectional.centerStart,
                    iconSize: 28,
                    focusColor: Constants.colorRed1,
                    onPressed: () => NavigationHandler.push(HomePage.route),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 68,
                    width: 68,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            '${_controller.pokemonDetailsModel!.spritesModel!.spritesOtherModel!.spritesHomeModel!.image}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          toCapitalize(
                              '${_controller.pokemonDetailsModel!.name}'),
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            toTitleText(
                                'Tipo: ${_controller.pokemonDetailsModel!.types![0]!.type!.name}'),
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: onPressed,
                  icon: isFavorited
                      ? Icon(
                          Icons.star,
                          color: Colors.white,
                        )
                      : Icon(
                          Icons.star_outline,
                          color: Colors.white,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
