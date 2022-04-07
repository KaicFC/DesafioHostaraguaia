import 'package:desafio_hostaraguaia/src/presentation/modules/home/home_controller.dart';
import 'package:desafio_hostaraguaia/src/presentation/modules/search/search_page.dart';
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
                            onPressed: () {},
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

class FormCustom extends StatelessWidget {
  final Function(String)? onSubmitted;
  final Color? color;
  final TextEditingController? controller;
  const FormCustom({
    Key? key,
    required this.onSubmitted,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 77),
      child: Container(
        height: 45,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 2,
              color: Constants.shadowColor!,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: onSubmitted,
                  showCursor: true,
                  cursorColor: const Color.fromARGB(255, 79, 79, 79),
                  decoration: const InputDecoration(
                    hintText: 'Digite o nome do Pokemon...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 189, 189, 189),
                    ),
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Constants.colorGrey2,
                  ),
                ),
              ),
              SizedBox(
                child: SvgPicture.asset(
                  'assets/search.svg',
                  height: 22,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isBlue;
  final bool isBlocked;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isBlue,
    required this.isBlocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 41,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            isBlocked
                ? Constants.colorGrey4
                : isBlue
                    ? Constants.primaryColor
                    : Constants.colorYellow,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.openSans(
            color: isBlocked
                ? Colors.white
                : isBlue
                    ? Colors.white
                    : Constants.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
