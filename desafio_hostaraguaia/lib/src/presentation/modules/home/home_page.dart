import 'package:desafio_hostaraguaia/src/presentation/modules/favorites/favorites_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/home/home_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/search/search_page.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/default_button.dart';
import 'package:desafio_hostaraguaia/src/presentation/widgets/form_custom.dart';
import 'package:desafio_hostaraguaia/src/shared/constants/constants.dart';
import 'package:desafio_hostaraguaia/src/shared/di/di.dart';
import 'package:desafio_hostaraguaia/src/shared/navigation/navigation_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = inject.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Observer(builder: (_) {
      return Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              Container(
                height: 85,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/pokemon.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/circles.svg',
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 46, bottom: 8),
                        child: Text(
                          'Conheça a Pokédex',
                          style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Constants.primaryColor,
                          ),
                        ),
                      ),
                      Text(
                        'Utilize a pokédex para encontrar mais informações sobre os seus pokémons.',
                        style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                          color: Constants.primaryColor,
                        ),
                      ),
                      FormCustom(
                        controller: _textController,
                        onSubmitted: (value) {
                          _controller.textForm = value;
                        },
                        color: _controller.textForm.isEmpty
                            ? Constants.colorGrey4
                            : Constants.primaryColor,
                      ),
                      DefaultButton(
                        title: 'Pesquisar',
                        onPressed: () {
                          _controller.textForm.isEmpty
                              ? debugPrint('pesquise')
                              : NavigationHandler.push(SearchPage.route,
                                  arguments: _controller.textForm);
                          _textController.clear();
                          _controller.textForm = '';
                        },
                        isBlue: true,
                        isBlocked: _controller.textForm.isEmpty ? true : false,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: DefaultButton(
                            title: 'Ver favoritos',
                            onPressed: () =>
                                NavigationHandler.push(FavoritesPage.route),
                            isBlue: false,
                            isBlocked: false),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

